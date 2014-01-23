class AddZipToGame < ActiveRecord::Migration
  def change
    add_column :games, :zip, :integer
  end
end
