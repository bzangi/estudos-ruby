# frozen_string_literal: true

require_relative 'player'
require_relative 'line'
require_relative 'game_turn'
require_relative 'treasure_trove'

module StudioGame
  class Game
    attr_reader :title

    def initialize(title)
      @title = title
      @players = []
    end

    def add_player(player)
      @players.push(player)
    end

    def play(rounds)
      2.times do
        StudioGame::Line.print_line
      end
      puts "The game started on #{Time.new.strftime('%A %d/%m/%Y at %I:%M%p')}"
      2.times do
        StudioGame::Line.print_line
      end

      puts "There are #{@players.count} players in #{@title}"
      puts @players.sort

      StudioGame::Line.print_line

      loot = StudioGame::TreasureTrove::TREASURES
      puts "There are #{loot.size} different treasures to be found: "

      loot.each do |treasure|
        puts "A #{treasure.name} is worth #{treasure.points} points"
      end

      StudioGame::Line.print_line

      1.upto(rounds) do |round|
        puts "\nRound #{round}: "
        @players.each do |p|
          StudioGame::GameTurn.take_turn(p)
        end
      end
    end

    def total_points
      @players.reduce(0) { |sum, player| sum + player.points }
    end

    def print_name_health(player)
      puts "#{player.name} (#{player.health})"
    end

    def print_stats
      strong_players = @players.select(&:strong?)
      wimpy_players = @players.reject(&:strong?)

      puts "\n#{@title} Statistics:"

      puts "\n#{strong_players.size} strong players:"
      strong_players.sort.each do |player|
        print_name_health(player)
      end

      puts "\n#{wimpy_players.size} wimpy players:"
      wimpy_players.sort.each do |player|
        print_name_health(player)
      end

      StudioGame::Line.print_line

      puts "\n#{total_points} total points from treasures found"

      @players.sort.each(&method(:each_partial))

      puts "\n#{@title} Score Tier List:"
      @players.sort.each do |player|
        puts format_name_and_score(player)
      end
    end

    def load_players(file)
      File.readlines(file).each do |line|
        add_player(StudioGame::Player.from_csv(line))
      end
    end

    def save_game_results(to_file = 'high_scores.txt')
      File.open(to_file, 'w') do |file|
        file.puts "\n#{@title} Score Tier List:"
        @players.sort.each do |player|
          file.puts format_name_and_score(player)
        end
      end
    end

    private

    def each_partial(player)
      puts "\n#{player.name}'s point partial: "
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
    end

    def format_name_and_score(player)
      "#{player.name.ljust(25, '.')} #{player.score.to_s.rjust(3)}"
    end
  end
end