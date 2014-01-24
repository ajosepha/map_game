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
    local_orgs = CulturalOrganization.where(:zip_code => zip).to_a
    local_orgs.each do |org|
      self.cultural_organizations << org
    end
  end

  def find_community_health_centers
    health_centers = CommunityHealthCenter.where(:zip => zip).to_a
      health_centers.each do |center|
        self.community_health_centers << center
      end
  end

  def find_complaints
    local_complaints = Complaint.where(:incident_zip => zip).to_a
    local_complaints.each do |complaint|
      self.complaints << complaint
    end
  end

end
