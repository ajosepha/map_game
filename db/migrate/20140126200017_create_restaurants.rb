class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string  :name
      t.string  :street_address
      t.integer :zip
      t.string  :cuisine
      t.datetime :inspection_date
      t.string  :violation
      t.string  :current_grade
      t.belongs_to :game_zip

      t.timestamps
    end
  end
end
