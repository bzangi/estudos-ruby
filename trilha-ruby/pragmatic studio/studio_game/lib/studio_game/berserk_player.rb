require_relative 'player'

module StudioGame
  class BerserkPlayer < Player
    def initialize(name, health = 80)
      super(name, health)
      @w00t_count = 0
    end

    def berserk?
      @w00t_count > 5
    end

    def w00t
      super
      @w00t_count += 1
      puts "#{name} gone berserk!" if berserk?
      # berserk? ? (puts "#{name} gone berserk!") : {} ## MESMO EFEITO
    end

    def blam
      if berserk?
        puts "#{name} got blammed, but he is a F*CKING BERSERK"
        w00t
      else
        @health -= 15
        puts "#{@name} got blammed! #{@health} health points left (#{status})"
        # super ## CODIGO ORIGINAL
      end
    end
  end

  if __FILE__ == $0
    berserker = BerserkPlayer.new("berserker", 50)
    5.times { berserker.w00t }
    1.times { berserker.blam }
    berserker.w00t
    berserker.blam
  end
end