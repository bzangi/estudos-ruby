# frozen_string_literal: true

require_relative '../lib/studio_game/game.rb'
require_relative '../lib/studio_game/clumsy_player.rb'
require_relative '../lib/studio_game/berserk_player.rb'

knuckleheads = StudioGame::Game.new('Knuckleheads')
default_game_file = File.join(File.dirname(__FILE__), 'players.csv')
knuckleheads.load_players(ARGV.shift || default_game_file)

klutz = StudioGame::ClumsyPlayer.new('klutz', 105, 2)
knuckleheads.add_player(klutz)

berserker = StudioGame::BerserkPlayer.new('berserker', 50)
knuckleheads.add_player(berserker)

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/ # caso seja um número
    if answer.to_i.positive?
      knuckleheads.play(answer.to_i)
    else
      puts "Enter a valid number or 'quit'"
    end
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  else
    puts "Enter a valid number or 'quit'"
  end
end

knuckleheads.save_game_results
