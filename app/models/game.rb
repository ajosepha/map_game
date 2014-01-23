class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :zip



  def find_cultural_organizations
    CulturalOrganization.where("zip_code == 11205").find_each do |organization|
      organization.organization_name
    end
  end

end
