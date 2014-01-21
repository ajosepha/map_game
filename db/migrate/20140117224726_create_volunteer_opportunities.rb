class CreateVolunteerOpportunities < ActiveRecord::Migration
  def change
    create_table :volunteer_opportunities do |t|
      t.string  :title
      t.string  :human_address
      t.float   :longitude
      t.float   :latitude
      t.timestamps
    end
  end
end
