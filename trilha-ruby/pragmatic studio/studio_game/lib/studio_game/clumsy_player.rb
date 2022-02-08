# frozen_string_literal: true

require_relative 'player'
require_relative 'dice'

module StudioGame
  class ClumsyPlayer < Player
    attr_reader :boost_factor

    def initialize(name, health = 100, boost_factor = 1)
      super(name, health)
      @boost_factor = boost_factor
    end

    def found_treasure(treasure)
      damage = random_damage
      damaged_treasure = Treasure.new(treasure.name, treasure.points / damage)
      super(damaged_treasure)
    end

    def random_damage
      dice = Dice.new #USAR OUTRO DADO
      unlucky = dice.simple_roll

      case unlucky
      when 1..2
        1
      when 3..5
        2
      else
        3
      end
    end

    def w00t
      @boost_factor.times { super }
    end
  end

  if __FILE__ == $PROGRAM_NAME
    clumsy = ClumsyPlayer.new('klutz', 80, 3)
    hammer = Treasure.new(:hammer, 50)
    clumsy.w00t
    clumsy.found_treasure(hammer)
    clumsy.found_treasure(hammer)
    clumsy.found_treasure(hammer)
    crowbar = Treasure.new(:crowbar, 400)
    clumsy.found_treasure(crowbar)
    clumsy.each_found_treasure do |treasure|
      puts "#{treasure.points} total #{treasure.name} points"
    end
    puts "#{clumsy.points} grand total points"
  end
end