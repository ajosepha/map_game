class CreateGarden < ActiveRecord::Migration

  def change
    create_table :gardens do |t|
      t.string :garden_name
      t.string :address
      t.string :neighborhoodname
      t.string :boro
      t.float :size
      t.float :latitude
      t.float :longitude
    end
  end

end
