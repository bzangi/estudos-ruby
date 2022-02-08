module Flicks
  module Reviewer #não da pra instanciar

    def self.roll_dice
      rand(1..6)
    end

    def self.review(movie)
      number_rolled = roll_dice
      case number_rolled
      when 3..4
        puts "#{movie.title} was skipped."
      when 1..2
        movie.thumbs_down
      else
        movie.thumbs_up
      end
    end
  end
end