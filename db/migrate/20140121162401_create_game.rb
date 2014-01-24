class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.integer :points
      t.integer :money
      t.belongs_to :game_zip
      t.belongs_to :user

      t.timestamps
    end
  end
end