class CreateLicensedBusiness < ActiveRecord::Migration
  def change
    create_table :licensed_businesses do |t|
      t.string :trade_name
      t.string :business_name
      t.string :full_address
      t.integer :zip_code
      t.string :industry
      t.float :latitude
      t.float :longitude
      t.belongs_to :game_zip
      t.timestamps
    end
  end
end
