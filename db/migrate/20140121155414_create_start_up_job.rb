class CreateStartUpJob < ActiveRecord::Migration
  def change
    create_table :start_up_jobs do |t|
      t.string :company_name
      t.string :address
      t.string :hiring
      t.integer :zip
      t.integer :longitude
      t.integer :latitude
      t.belongs_to :game_zip
      t.timestamps
    end

  end
end


