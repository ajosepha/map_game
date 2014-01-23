class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.integer :points
      t.integer :money
      # t.belongs_to :user_id
      # t.belongs_to :neighborhood_id
      
      # items_neighborhood_has.each do |resource|
      #   t.bool :has_resource
      # end

      t.timestamps
    end
  end
end