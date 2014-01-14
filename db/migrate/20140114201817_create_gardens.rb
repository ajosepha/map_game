class CreateGardens < ActiveRecord::Migration
  def change
    create_table :gardens do |t|

      t.string :garden_name
      t.string :address
      t.float :size
      t.string :nyc_neighborhood
      t.string :boro


      t.timestamps
    end
  end
end
