require_relative 'treasure_trove'
require_relative 'playable'

module StudioGame
  class Player
    include StudioGame::Playable

    attr_accessor :name, :health

    def initialize(name, health = 100)
      @name = name.capitalize
      @health = health
      @found_treasures = Hash.new(0)
    end

    def each_found_treasure
      @found_treasures.each do |name, points|
        treasure = StudioGame::Treasure.new(name, points)
        yield treasure
      end
    end

    def found_treasure(treasure)
      @found_treasures[treasure.name] += treasure.points
      puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
      # puts "#{@name}'s treasures: #{@found_treasures.keys}"
    end

    def self.from_csv(line)
      name, health = line.split(',')
      player = StudioGame::Player.new(name, Integer(health))
    end

    def score
      @health + points
    end

    def points
      @found_treasures.values.reduce(0, :+)
    end

    def name=(new_name)
      @name = new_name.capitalize
    end

    def <=>(other_player)
      other_player.score <=> score
    end

    def to_s
      "I'm #{@name} with health = #{@health}HP, points = #{points} and a score = #{score}."
    end

  end

  if __FILE__ == $0
    player = StudioGame::Player.new("moe")
    puts player.name
    puts player.health
    player.w00t
    puts player.health
    player.blam
    puts player.health
  end
end