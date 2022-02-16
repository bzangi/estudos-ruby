class MoviesController < ApplicationController

  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :require_signin, except: [:index, :show, :upcoming]
  before_action :require_admin, except: [:index, :show, :upcoming]

  def index #action
    case params[:filter]
      when 'flops'
        @movies = Movie.released.select{ |movie| movie.flop? }
      else
        @movies = Movie.send(movies_filter)
    end
  end

  def show

    @fans = @movie.fans
    @genres = @movie.genres.order(:name)
    if current_user
      @favorite = current_user.favorites.find_by(movie_id: @movie.id)
    end

  end

  def edit
  end

  def update

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
    @movie.destroy

    redirect_to movies_url, alert: "Event successfully deleted!"
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :rating,
                                  :released_on, :total_gross, :duration,
                                  :director, :image_file_name, genre_ids: [])
  end

  def movies_filter
    if params[:filter].in? %w(released upcoming recent hits)
      params[:filter]
    else
      :all
    end
  end

  def set_movie
    @movie = Movie.find_by!(slug: params[:id])
  end
end
