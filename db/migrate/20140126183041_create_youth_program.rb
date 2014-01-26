class CreateYouthProgram < ActiveRecord::Migration
  def change
    create_table :youth_programs do |t|
      t.string  :program
      t.string  :agency
      t.string  :site_name
      t.string  :grade_level_age_group
      t.string  :address
      t.integer :zip
      t.float   :longitude
      t.float   :latitude
      t.belongs_to :game_zip

      t.timestamps
    end
  end
end