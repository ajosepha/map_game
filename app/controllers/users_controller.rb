class UsersController < ApplicationController
  protect_from_forgery

  def new
    @user = User.new
  end

  def game
    @game = user.game
    @zip = user.game.zip
  end

end