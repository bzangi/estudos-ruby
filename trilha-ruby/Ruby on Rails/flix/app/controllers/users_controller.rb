class UsersController < ApplicationController

  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.not_admins
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @favorite_movies = @user.favorite_movies
  end

  def edit
  end

  def update

    if @user.update(user_params)
      redirect_to @user, notice: "#{@user.name} account successfully updated!"
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "User successfully created!"
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil

    redirect_to movies_url, alert: "Account successfully deleted!"
  end

  private

  def require_correct_user
    @user = User.find(params[:id])
    redirect_to current_user unless current_user?(@user)
  end

  def user_params
    params.require(:user).permit(:username, :name, :email,
                                 :password, :password_confirmation)
  end
end
