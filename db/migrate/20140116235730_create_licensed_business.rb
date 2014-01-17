class CreateLicensedBusiness < ActiveRecord::Migration
  def change
    create_table :licensed_businesses do |t|
      t.string :trade_name
      t.string :business_name
      t.string :full_address
      t.string :industry
    end
  end
end
