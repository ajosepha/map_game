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

  def before
    CommunityHealthCenter.make_community_health_centers if CommunityHealthCenter.first.class == NilClass
    Complaint.make_complaints if Complaint.first.class == NilClass
    CulturalOrganization.make_cultural_organizations if CulturalOrganization.first.class == NilClass
    Garden.make_gardens if Garden.first.class == NilClass
    GovJob.make_gov_jobs if GovJob.first.class == NilClass
    LicensedBusiness.make_licensed_businesses if LicensedBusiness.first.class == NilClass
    RecyclingBin.make_recycling_bins if RecyclingBin.first.class == NilClass
    StartUpJob.make_start_up_jobs if StartUpJob.first.class == NilClass
    VolunteerOpportunity.make_volunteer_opportunities if VolunteerOpportunity.first.class == NilClass
  end

  # GET /game_zips/1
  # GET /game_zips/1.json
  def show
    if GameZip.nyc_zips.include?(params[:zip])
      # if GameZip.where(:zip => params[:zip]). == 0
      #   @game_zip = GameZip.create!(:zip => params[:zip])
      # else
        @game_zip = GameZip.where(:zip => params[:zip]).first
      # end
    @game_zip.find_community_health_centers if @game_zip.community_health_centers.length == 0
    @game_zip.find_complaints if @game_zip.complaints.length == 0
    @game_zip.find_cultural_organizations if @game_zip.cultural_organizations.length == 0
    # NO ZIP @game_zip.find_gardens if @game_zip.gardens.length == 0
    # NO ZIP @game_zip.find_gov_jobs if @game_zip.gov_jobs.length == 0
    @game_zip.find_licensed_businesses if @game_zip.licensed_businesses.length == 0
    # NO ZIP @game_zip.find_recycling_bins if @game_zip.recycling_bins.length == 0
    # @game_zip.find_start_up_jobs if @game_zip.start_up_jobs.length == 0
    # @game_zip.find_volunteer_opportunities if @game_zip.volunteer_opportunities.length == 0
    # @game_zip.save
    end

    respond_to do |format|
      if @game_zip.class == NilClass
        format.html { :notice => 'This is not a nyc zip code.' }
      else
        format.html # show.html.erb
        format.json { render json: @game_zip }
      end
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
