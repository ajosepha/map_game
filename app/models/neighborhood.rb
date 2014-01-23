class Neighborhood < ActiveRecord::Base
  has_many :games
  has_many :users, :through => :games

  has_many :gardens
  has_many :licensed_businesses
  has_many :complaints
  has_many :cultural_organizations
  has_many :recycling_bins
  has_many :volunteer_opportunities
  has_many :gov_jobs
  has_many :community_health_centers
  has_many :start_up_jobs
end