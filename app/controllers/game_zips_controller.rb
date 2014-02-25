class GameZipsController < ApplicationController
  
  def show
    if GameZip.where(:zip => params[:id]).length == 0
      @game_zip = GameZip.create(:zip => params[:id])
      else
      @game_zip = GameZip.where(:zip => params[:id]).first
    end

    @game_zip.populate_tables
    @game_zip.find_features
  end

  def error
  end

  def index
    GameZip.make_game_zips if GameZip.all.length == 0
    @game_zips = GameZip.all
  end

  def new
  end

end
