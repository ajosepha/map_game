class GameZipsController < ApplicationController
  # GET /game_zips
  # GET /game_zips.json
  # def index
  #   @game_zips = GameZip.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @game_zips }
  #   end
  # end

  # GET /game_zips/1
  # GET /game_zips/1.json
  def show
    @game_zip = GameZip.where(:zip == params[:zip]).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game_zip }
    end
  end

  # GET /game_zips/new
  # GET /game_zips/new.json
  # def new
  #   @game_zip = GameZip.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @game_zip }
  #   end
  # end

  # GET /game_zips/1/edit
  # def edit
  #   @game_zip = GameZip.find(params[:id])
  # end

  # POST /game_zips
  # POST /game_zips.json
  # def create
  #   @game_zip = GameZip.new(params[:game_zip])

  #   respond_to do |format|
  #     if @game_zip.save
  #       format.html { redirect_to @game_zip, notice: 'Game zip was successfully created.' }
  #       format.json { render json: @game_zip, status: :created, location: @game_zip }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @game_zip.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PUT /game_zips/1
  # PUT /game_zips/1.json
  # def update
  #   @game_zip = GameZip.find(params[:id])

  #   respond_to do |format|
  #     if @game_zip.update_attributes(params[:game_zip])
  #       format.html { redirect_to @game_zip, notice: 'Game zip was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @game_zip.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /game_zips/1
  # DELETE /game_zips/1.json
  # def destroy
  #   @game_zip = GameZip.find(params[:id])
  #   @game_zip.destroy

  #   respond_to do |format|
  #     format.html { redirect_to game_zips_url }
  #     format.json { head :no_content }
  #   end
  # end
end
