module StudioGame
  module Playable

    def blam
      self.health -= 10
      puts "#{name} got blammed! #{self.health} health points left (#{status})"
    end

    def w00t
      self.health += 15
      puts "#{name} got w00ted! And now has #{self.health} health points(#{status})"
    end

    def strong?
      health > 100
    end

    def status
      strong? ? 'Strong' : 'Wimpy'
    end
  end
end