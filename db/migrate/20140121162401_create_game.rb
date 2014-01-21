class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.integer :points
      t.integer :money
      t.id :user_id
      t.id :neighborhood_id
      
      items_neighborhood_has.each do |resource|
        t.bool :has_resource
      end

      t.timestamps
    end
  end
end