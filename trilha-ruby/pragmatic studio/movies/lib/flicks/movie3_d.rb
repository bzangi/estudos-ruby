# frozen_string_literal: true

require_relative 'movie'

module Flicks
  class Movie3D < Flicks::Movie #herança
    attr_reader :wow_factor

    def initialize(title, rank, wow_factor)
      super(title, rank)
      @wow_factor = wow_factor
    end

    def thumbs_up
      @rank += @wow_factor
      puts "#{@title} got thumbs up and its new rank is #{@rank} (#{status})"
      # @wow_factor.times { super }
    end

    def show_effect
      puts 'Wow! ' * @wow_factor
    end
  end

  if __FILE__ == $0
    movie3d = Movie3D.new('Pequenos espiões', 5, 7)
    movie3d.thumbs_up
    puts movie3d.show_effect
  end
end