class CreateGameZip < ActiveRecord::Migration
  def change
    create_table :game_zips do |t|
      t.integer :zip

      t.timestamps
    end
  end
end
