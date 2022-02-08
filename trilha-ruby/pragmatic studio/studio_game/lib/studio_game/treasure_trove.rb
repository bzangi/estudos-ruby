# frozen_string_literal: true

module StudioGame
  Treasure = Struct.new(:name, :points)

  module TreasureTrove
    TREASURES = [
      Treasure.new(:poison, -100),
      Treasure.new(:nail_jar, 0),
      Treasure.new(:worm, 2),
      Treasure.new(:cloth, 3),
      Treasure.new(:pie, 5),
      Treasure.new(:bottle, 25),
      Treasure.new(:hammer, 50),
      Treasure.new(:skillet, 100),
      Treasure.new(:broomstick, 200),
      Treasure.new(:crowbar, 400)
    ].freeze

    def self.random
      weights = [6, 14, 6, 7, 10, 15, 14, 13, 9, 6]

      normalized_weights = weights.map { |w| (Float w) / weights.reduce(:+) }
      loaded_die = TREASURES.zip(normalized_weights).to_h
      loaded_die.max_by { |_, weight| rand ** (1.0 / weight) }.first
    end
  end

end
puts TreasureTrove::TREASURES if __FILE__ == $PROGRAM_NAME
