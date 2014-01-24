class CreateRecylingBin < ActiveRecord::Migration
  def change
    create_table :recycling_bins do |t|
      t.string :park_site_name
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end

end
