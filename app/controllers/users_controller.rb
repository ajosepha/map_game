class UsersController < ApplicationController
  protect_from_forgery

 

  # def game
  #   @game = user.game
  #   @zip = user.game.zip
  # end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Map Game!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  # def index
  # end

  # private
  #  def user_params
  #     params.require(:user).permit(:name, :email, :password,
  #                                  :password_confirmation)
  #   end
  
end