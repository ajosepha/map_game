class RemoveTwitterFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :twitter
  end

  def down
    add_column :users, :twitter, :string
  end
end
