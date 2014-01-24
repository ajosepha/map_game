class CreateCommunityHealthCenter < ActiveRecord::Migration
  def change
    create_table :community_health_centers do |t|
      t.string :name_of_center
      t.string :center_address
      t.integer :zip
      t.float :latitude
      t.float :longitude
      t.belongs_to :game_zip
      t.timestamps
    end
  end
end
