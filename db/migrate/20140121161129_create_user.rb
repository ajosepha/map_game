class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :password
        t.string :user_name
        t.string :email
        t.string :twitter

      t.timestamps
    end
  end
end
