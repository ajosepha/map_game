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
  has_many :youth_programs

@@nyc_zips = [10453, 10457, 10460, 10458, 10467, 10468,10451, 10452, 10456, 10454, 10455, 10459, 10474, 10463, 10471, 10466, 10469, 10470, 10475, 10461, 10462,10464, 10465, 10472, 10473, 11212, 11213, 11216, 11233, 11238, 11209, 11214, 11228, 11204, 11218, 11219, 11230, 11234, 11236, 11239, 11223, 11224, 11229, 11235, 11201, 11205, 11215, 11217, 11231, 11203, 11210, 11225, 11226, 11207, 11208, 11211, 11222, 11220, 11232, 11206, 11221, 11237, 10026, 10027, 10030, 10037, 10039, 10001, 10011, 10018, 10019, 10020, 10036, 10029, 10035, 10010, 10016, 10017, 10022, 10012, 10013, 10014, 10004, 10005, 10006, 10007, 10038, 10280, 10002, 10003, 10009, 10021, 10028, 10044, 10128, 10023, 10024, 10025, 10031, 10032, 10033, 10034, 10040, 11361, 11362, 11363, 11364, 11354, 11355, 11356, 11357, 11358, 11359, 11360, 11365, 11366, 11367, 11412, 11423, 11432, 11433, 11434, 11435, 11436, 11101, 11102, 11103, 11104, 11105, 11106, 11374, 11375, 11379, 11385, 11691, 11692, 11693, 11694, 11695, 11697, 11004, 11005, 11411, 11413, 11422, 11426, 11427, 11428, 11429,11414, 11415, 11416, 11417, 11418, 11419, 11420, 11421, 11368, 11369, 11370, 11372, 11373, 11377, 11378, 10302, 10303, 10310, 10306, 10307, 10308, 10309, 10312, 10301, 10304, 10305, 10314]

  def self.nyc_zips
    @@nyc_zips
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

  def find_senior_centers
    local_centers = SeniorCenter.where(:program_zipcode => zip).to_a
    local_centers.each do |center|
      self.senior_centers << center
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
    local_programs = YouthPrograms.where(:zip => zip).to_a
    local_programs.each do |program|
      self.youth_programs << program
    end
  end


end
