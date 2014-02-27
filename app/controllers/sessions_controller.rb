class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate[:password]
      session[:user_id] = user.id
        redirect_to root_url, notice: "Logged in!"
        #above will need to be changed, this is a test
    else
      flash.now.alert = "Email or password is not valid"
      render "new"
    end
  end

  def destroy
  end
end
