class CreateSeniorCenters < ActiveRecord::Migration
  def change
    create_table :senior_centers do |t|
      t.string  :program_name
      t.string  :sponsor_name
      t.string  :program_address
      t.integer :program_zipcode
      t.float   :longitude
      t.float   :latitude
      t.belongs_to :game_zip

      t.timestamps
    end
  end
end
