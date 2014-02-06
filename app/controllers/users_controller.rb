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
      flash[:login_success] = "Welcome! Login Successful."
      redirect_to @user #Should send to create a new game. Send to games controller
    else
      flash[:login_failure] = "Invalid login. Please try again."
      render 'diagnostics'
    end
  end

  def show
  end
  
end