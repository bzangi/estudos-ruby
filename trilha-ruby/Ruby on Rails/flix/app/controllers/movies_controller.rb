class MoviesController < ApplicationController
  def index #action
    @movies = Movie.released
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to @movie, notice: "Event successfully updated!"
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie, notice: "Event successfully created!"
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_url, alert: "Event successfully deleted!"
  end

  def upcoming
    @movies = Movie.upcoming
  end
  private

    def movie_params
      params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :duration, :director, :image_file_name)
    end
end
