class CreateComplaint < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.datetime :created_date
      t.datetime :closed_date
      t.string :complaint_type
      t.string :descriptor
      t.string :incident_address
      t.integer :incident_zip
      t.float :latitude
      t.float :longitude
      t.belongs_to :game_zip
      t.timestamps
    end
  end
  
end
