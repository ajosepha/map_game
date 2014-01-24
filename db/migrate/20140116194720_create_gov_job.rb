class CreateGovJob < ActiveRecord::Migration
  def change
    create_table :gov_jobs do |t|
      t.string :work_location
      t.integer :salary_range_to
      t.integer :salary_range_from
      t.integer :job_id
      t.datetime :posting_date
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end 