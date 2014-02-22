class UsersController < ApplicationController
  protect_from_forgery

  def new
    @user = User.new
  end

  def game
    @game = user.game
    @zip = user.game.zip
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
  end

  private
   def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
  
end