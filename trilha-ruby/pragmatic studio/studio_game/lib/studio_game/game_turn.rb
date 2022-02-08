# frozen_string_literal: true

require_relative 'dice'
require_relative 'loaded_dice'
require_relative 'treasure_trove'
# require_relative 'player'

module StudioGame
  module GameTurn
    def self.take_turn(player)
      dice = StudioGame::Dice.new

      lucky_number = dice.roll

      case lucky_number
      when 1..2
        player.blam
      when 3..4
        puts "#{player.name} still has #{player.health} health points!"
      else
        player.w00t
      end
      take_treasure(player)
    end

    def self.take_treasure(player)
      treasure = StudioGame::TreasureTrove.random
      player.found_treasure(treasure)
    end
  end
end