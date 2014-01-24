class GameZip < ActiveRecord::Base
  attr_accessible :zip

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

  def find_cultural_organizations
    @cultural_organizations = CulturalOrganization.where(:zip_code => self.zip.zip).to_a
  end

  def find_community_health_centers
    @community_health_centers = CommunityHealthCenter.where(:zip => self.zip.zip).to_a
  end

end
