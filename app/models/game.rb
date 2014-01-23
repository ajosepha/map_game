class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :zip



  def find_cultural_organizations
    @cultural_organizations = CulturalOrganization.where(:zip_code => self.zip.zip).to_a
  end



end
