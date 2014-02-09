class GameZipsController < ApplicationController
  
  def before
  #   Garden.make_gardens if Garden.first.class == NilClass
  #   GovJob.make_gov_jobs if GovJob.first.class == NilClass
  #   RecyclingBin.make_recycling_bins if RecyclingBin.first.class == NilClass
  end

  def show
    if GameZip.where(:zip => params[:zip]).length == 0
      @game_zip = GameZip.create(:zip => params[:zip])
      else
      @game_zip = GameZip.where(:zip => params[:zip]).first
    end

    @game_zip.populate_tables
    @game_zip.find_features
  end

  def error
  end

  def index
    @game_zip = GameZip.new
  end

end
