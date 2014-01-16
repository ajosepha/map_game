class CreateCommunityHealthCenter < ActiveRecord::Migration

  def change
    create_table :community_health_centers do |t|
      t.string :name_of_center
      t.string :center_address
      t.integer :zip

    end
  end
end
