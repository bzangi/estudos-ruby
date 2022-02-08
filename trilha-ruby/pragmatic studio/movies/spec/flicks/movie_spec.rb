require '../../lib/flicks/movie'
require '../spec_helper.rb'

module Flicks
  describe Movie do

    before do
      @initial_rank = 10
      @movie = Movie.new("goonies", @initial_rank)
    end

    it 'has a capitalized title' do
      @movie.title.should == "Goonies"
    end

    it 'has an initial rank' do
      @movie.rank.should == 10
    end

    it 'has a string representation' do
      @movie.to_s.should == "Goonies has a rank of 10 (Hit)"
    end

    it 'increases rank by 1 when given a thumbs up' do
      @movie.thumbs_up

      @movie.rank.should == @initial_rank + 1
    end

    it 'decreases rank by 1 when given a thumbs down, except when the rank is already 0' do
      @movie.thumbs_down

      @movie.rank.should == @initial_rank - 1
    end

    it 'throws an error message when a minimum rank movie receives a thumbs down' do
      zero_rank = 0
      movie_zero = Movie.new("goonies", zero_rank)

      movie_zero.thumbs_down

      movie_zero.rank.should == zero_rank
    end

    context "created with a default rank" do
      before do
        @movie = Movie.new("goonies")
      end

      it 'has a rank of 0' do
        @movie.rank.should == 0
      end
    end

    context 'with a rank of at least 10' do
      before do
        @movie = Movie.new("CDD", 10)
      end

      it 'is a hit' do
        # @movie.hit?.should be_truthy
        @movie.should be_hit
      end

      it 'has a hit status' do
        @movie.status.should == 'Hit'
      end

    end

    context 'with a rank of less than 10' do
      before do
        @movie = Movie.new("CDD", 7)
      end

      it 'is a flop' do
        # @movie.hit?.should be_falsey
        @movie.should_not be_hit
      end

      it 'has a flop status' do
        @movie.status.should == 'Flop'
      end

    end
  end
end