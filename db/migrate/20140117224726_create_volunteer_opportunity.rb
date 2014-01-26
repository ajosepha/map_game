class CreateVolunteerOpportunity < ActiveRecord::Migration
  def change
    create_table :volunteer_opportunities do |t|
      t.string  :title
      t.string  :org_title
      t.string  :address
      t.integer :zip
      t.float   :longitude
      t.float   :latitude
      t.belongs_to :game_zip
      t.timestamps
    end
  end
end
