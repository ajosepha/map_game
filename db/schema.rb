# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140117213905) do

  create_table "community_health_centers", :force => true do |t|
    t.string  "name_of_center"
    t.string  "center_address"
    t.integer "zip"
    t.float   "latitude"
    t.float   "longitude"
  end

  create_table "complaints", :force => true do |t|
    t.datetime "created_date"
    t.datetime "closed_date"
    t.string   "complaint_type"
    t.string   "descriptor"
    t.string   "incident_address"
    t.integer  "incident_zip"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "cultural_organizations", :force => true do |t|
    t.string  "organization_name"
    t.string  "discipline_code"
    t.string  "human_address"
    t.integer "zip_code"
    t.float   "longitude"
    t.float   "latitude"
  end

  create_table "gardens", :force => true do |t|
    t.string "garden_name"
    t.string "address"
    t.string "neighborhoodname"
    t.string "boro"
    t.float  "size"
    t.float  "latitude"
    t.float  "longitude"
  end

  create_table "gov_jobs", :force => true do |t|
    t.string   "work_location"
    t.integer  "salary_range_to"
    t.integer  "salary_range_from"
    t.integer  "job_id"
    t.datetime "posting_date"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "licensed_businesses", :force => true do |t|
    t.string  "trade_name"
    t.string  "business_name"
    t.string  "full_address"
    t.integer "zip_code"
    t.string  "industry"
    t.float   "latitude"
    t.float   "longitude"
  end

  create_table "recycling_bins", :force => true do |t|
    t.string "park_site_name"
    t.float  "latitude"
    t.float  "longitude"
  end

end
