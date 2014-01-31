class GamesController < ApplicationController

  def new
    @game = Game.new
    @user = User.find(params[:user_id])
  end
  
  def show
    @game = Game.find(params[:id]) 
  end

  def create
    @game = Game.new(:user_id => params[:user_id],:game_zip_id => GameZip.where(:zip => params[:game_zip]))
    render show
  end

end
