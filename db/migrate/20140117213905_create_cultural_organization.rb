class CreateCulturalOrganization < ActiveRecord::Migration
  def change
    create_table :cultural_organizations do |t| 
      t.string :organization_name
      t.string :discipline_code
      t.string :human_address
      t.integer :zip_code
      t.float :longitude
      t.float :latitude
    end
  end

end
