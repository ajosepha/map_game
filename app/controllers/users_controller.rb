class UsersController < ApplicationController
  protect_from_forgery

  def new
    @user = User.new
  end

end