# frozen_string_literal: true
module Flicks
  module Rankable
    def thumbs_up
      self.rank += 1
      puts "#{self.title} got thumbs up and its new rank is #{self.rank} (#{status})"
    end

    def thumbs_down
      if self.rank.positive?
        self.rank -= 1
        puts "#{self.title} got thumbs down and its new rank is #{self.rank} (#{status})"
      else
        puts "#{self.title} got thumbs down but already has the minimum rank"
      end
    end

    def hit?
      self.rank >= 10
    end

    def status
      hit? ? 'Hit' : 'Flop'
      # if hit?
      #     'Hit'
      # else
      #     'Flop'
      # end
    end

    def normalized_rank
      self.rank / 10
    end

    def <=>(other)
      other.rank <=> self.rank
    end
  end
end