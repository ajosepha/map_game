class GameZip < ActiveRecord::Base
  attr_accessible :zip

  has_many :games
  has_many :users, :through => :games

  has_many :community_health_centers
  has_many :complaints
  has_many :cultural_organizations
  has_many :gardens
  has_many :gov_jobs
  has_many :licensed_businesses
  has_many :recycling_bins
  has_many :restaurants
  has_many :senior_centers
  has_many :start_up_jobs
  has_many :volunteer_opportunities
  has_many :youth_programs

NYCZIPS = [10001, 10002, 10003, 10004, 10005, 10006, 10007, 10009, 10010, 10011, 10012, 10013, 10014, 10016, 10017, 10018, 10019, 10020, 10021, 10022, 10023, 10024, 10025, 10026, 10027, 10028, 10029, 10030, 10031, 10032, 10033, 10034, 10035, 10036, 10037, 10038, 10039, 10040, 10044, 10128, 10280, 10301, 10302, 10303, 10304, 10305, 10306, 10307, 10308, 10309, 10310, 10312, 10314, 10451, 10452, 10453, 10454, 10455, 10456, 10457, 10458, 10459, 10460, 10461, 10462, 10463, 10464, 10465, 10466, 10467, 10468, 10469, 10470, 10471, 10472, 10473, 10474, 10475, 11004, 11005, 11101, 11102, 11103, 11104, 11105, 11106, 11201, 11203, 11204, 11205, 11206, 11207, 11208, 11209, 11210, 11211, 11212, 11213, 11214, 11215, 11216, 11217, 11218, 11219, 11220, 11221, 11222, 11223, 11224, 11225, 11226, 11228, 11229, 11230, 11231, 11232, 11233, 11234, 11235, 11236, 11237, 11238, 11239, 11354, 11355, 11356, 11357, 11358, 11359, 11360, 11361, 11362, 11363, 11364, 11365, 11366, 11367, 11368, 11369, 11370, 11372, 11373, 11374, 11375, 11377, 11378, 11379, 11385, 11411, 11412, 11413, 11414, 11415, 11416, 11417, 11418, 11419, 11420, 11421, 11422, 11423, 11426, 11427, 11428, 11429, 11432, 11433, 11434, 11435, 11436, 11691, 11692, 11693, 11694, 11695, 11697]

FEATURES = ["community_health_centers", "cultural_organizations", "licensed_businesses", "restaurants", "senior_centers",  "volunteer_opportunities", "youth_programs"]

  def self.make_game_zips
    GameZip::NYCZIPS.each do |zip|
      GameZip.new(:zip => zip).save
    end
  end

  def populate_tables
    CommunityHealthCenter.make_community_health_centers if CommunityHealthCenter.first.class == NilClass
    # currently offline Complaint.make_complaints if Complaint.first.class == NilClass
    CulturalOrganization.make_cultural_organizations if CulturalOrganization.first.class == NilClass
    LicensedBusiness.make_licensed_businesses if LicensedBusiness.first.class == NilClass
    Restaurant.make_restaurants if Restaurant.first.class == NilClass
    SeniorCenter.make_senior_centers if SeniorCenter.first.class == NilClass
    StartUpJob.make_start_up_jobs if StartUpJob.first.class == NilClass
    VolunteerOpportunity.make_volunteer_opportunities if VolunteerOpportunity.first.class == NilClass
    YouthProgram.make_youth_programs if YouthProgram.first.class == NilClass
  end

  def find_features
    self.find_community_health_centers if self.community_health_centers.length == 0
    self.find_complaints if self.complaints.length == 0
    self.find_cultural_organizations if self.cultural_organizations.length == 0
    # # NO ZIP self.find_gardens if self.gardens.length == 0
    # # NO ZIP self.find_gov_jobs if self.gov_jobs.length == 0
    self.find_licensed_businesses if self.licensed_businesses.length == 0
    # # NO ZIP self.find_recycling_bins if self.recycling_bins.length == 0
    self.find_restaurants if self.restaurants.length == 0
    self.find_senior_centers if self.senior_centers.length == 0
    self.find_start_up_jobs if self.start_up_jobs.length == 0
    #self.find_volunteer_opportunities if self.volunteer_opportunities.length == 0
    self.find_youth_programs if self.youth_programs.length == 0
  end

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

  def find_licensed_businesses
    local_businesses = LicensedBusiness.where(:zip_code =>zip).to_a
    local_businesses.each do |business|
      self.licensed_businesses << business
    end
  end

  def find_restaurants
    local_restaurants = Restaurant.where(:zip => zip).to_a
    local_restaurants.each do |restaurant|
      self.restaurants << restaurant unless self.restaurants.include?(restaurant.name)
    end
  end

  def find_senior_centers
    local_centers = SeniorCenter.where(:program_zipcode => zip).to_a
    local_centers.each do |center|
      self.senior_centers << center
    end
  end

  def find_start_up_jobs
    local_jobs = StartUpJob.where(:zip => zip).to_a
    local_jobs.each do |job|
      self.start_up_jobs << job
    end
  end

  def find_volunteer_opportunities
    local_opportunity = VolunteerOpportunity.where(:zip => zip).to_a
    local_opportunity.each do |opportunity|
      self.volunteer_opportunities << opportunity
    end
  end

  def find_youth_programs
    local_programs = YouthProgram.where(:zip => zip).to_a
    local_programs.each do |program|
      self.youth_programs << program
    end
  end


end
