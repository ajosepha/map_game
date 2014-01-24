class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :game_zip

  attr_reader :cultural_organizations, :community_health_centers


  def find_cultural_organizations
    @cultural_organizations = CulturalOrganization.where(:zip_code => self.zip.zip).to_a
  end

  def find_community_health_centers
    @community_health_centers = CommunityHealthCenter.where(:zip => self.zip.zip).to_a
  end


end
