require_relative 'auditable'

module StudioGame
  class Dice
    include Auditable

    attr_reader :number

    def roll
      @number = rand(1..6)
      audit
      @number
    end

    def simple_roll
      @number = rand(1..6)
    end
  end
end