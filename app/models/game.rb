class Game < ActiveRecord::Base
  belongs_to :user
  has_one :game_zips

  attr_accessible :status_community_health_centers, :status_complaints, :status_cultural_organizations,
  :status_gardens, :status_gov_jobs, :status_licensed_businesses, :status_recycling_bins, :status_restaurants, :status_senior_centers,
  :status_start_up_jobs, :status_volunteer_opportunities, :status_youth_programs

end
