# frozen_string_literal: true

require '../../lib/flicks/playlist'
require '../spec_helper.rb'

module Flicks
  describe 'Playlist' do
    before do
      @playlist = Playlist.new('Bruno')
    end

    context 'being played with one movie' do
      before do
        @initial_rank = 10
        @movie = Movie.new('goonies', @initial_rank)
        @playlist.add_movie(@movie)
      end

      it 'gives the movie a thumbs up if a high number is rolled' do
        Reviewer.stub(:roll_dice).and_return(5)
        @playlist.play(1)

        @movie.rank.should == @initial_rank + 1

      end

      it 'skips the movie if a medium number is rolled' do
        Reviewer.stub(:roll_dice).and_return(3)
        @playlist.play(1)

        @movie.rank.should == @initial_rank
      end

      it 'gives the movie a thumbs down if a low number is rolled' do
        Reviewer.stub(:roll_dice).and_return(1)
        @playlist.play(1)

        @movie.rank.should == if @initial_rank <= 0
                                @initial_rank
                              else
                                @initial_rank - 1
                              end
      end
    end
  end
end
