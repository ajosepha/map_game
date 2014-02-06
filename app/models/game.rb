class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :game_zip

  attr_accessible :status_community_health_centers, :status_complaints, :status_cultural_organizations,
  :status_gardens, :status_gov_jobs, :status_licensed_businesses, :status_recycling_bins, :status_restaurants, :status_senior_centers,
  :status_start_up_jobs, :status_volunteer_opportunities, :status_youth_programs, :money, :points, :game_zip_id, :user_id
  
  #has to run after game_zip.find_features
  def find_status
  	if self.game_zip.restaurants.length == 0
  		self.status_restaurants = -1
  	else self.status_restaurants = 0
  	end
  	
  	
  	if self.game_zip.community_health_centers.length == 0
  		self.status_community_health_centers = -1
  	else self.status_community_health_centers = 0
  	end

  	if self.game_zip.complaints.length == 0
  		self.status_complaints = -1
  	else self.status_complaints = 0
  	end

  	if self.game_zip.cultural_organizations.length == 0
  		self.status_cultural_organizations = -1
  	else self.status_cultural_organizations = 0
  	end

  	# if self.game_zip.gardens.length == 0
  	# 	self.status_gardens = -1
  	# else self.status_gardens = 0
  	# end

  	# # if self.game_zip.gov_jobs.length == 0
  	# # 	self.status_gov_jobs = -1
  	# # else self.status_gov_jobs = 0
  	# # end

  	if self.game_zip.licensed_businesses.length == 0
  		self.status_licensed_businesses = -1
  	else self.status_licensed_businesses = 0
  	end

  	# # if self.game_zip.recycling_bins.length == 0
  	# # 	self.status_recycling_bins = -1
  	# # else self.status_recycling_bins = 0
  	# # end

  	if self.game_zip.senior_centers.length == 0
  		self.status_senior_centers = -1
  	else self.status_senior_centers = 0
  	end

  	 if self.game_zip.start_up_jobs.length == 0
  	 	self.status_start_up_jobs = -1
  	 else self.status_start_up_jobs = 0
  	 end

  	 if self.game_zip.volunteer_opportunities.length == 0
  	 	self.status_volunteer_opportunities = -1
  	 else self.status_volunteer_opportunities = 0
  	 end

  	 if self.game_zip.youth_programs.length == 0
  	 	self.status_youth_programs = -1
  	 else self.status_youth_programs = 0
  	 end

	self.save
  end

  def win?
    win = true
    GameZip::FEATURES.each do |feature_name|
      accessor = "status_"+feature_name
      win = false if self.send(accessor.to_sym) == 0
    end
    win
  end
end
 















