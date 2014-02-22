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

ActiveRecord::Schema.define(:version => 20140222233150) do

  create_table "community_health_centers", :force => true do |t|
    t.string   "name_of_center"
    t.string   "center_address"
    t.integer  "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "game_zip_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
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
    t.integer  "game_zip_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "cultural_organizations", :force => true do |t|
    t.string   "organization_name"
    t.string   "discipline_code"
    t.string   "human_address"
    t.integer  "zip_code"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "game_zip_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "game_zips", :force => true do |t|
    t.integer  "zip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "points"
    t.integer  "money"
    t.integer  "game_zip_id"
    t.integer  "user_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "status_community_health_centers"
    t.integer  "status_complaints"
    t.integer  "status_cultural_organizations"
    t.integer  "status_gardens"
    t.integer  "status_gov_jobs"
    t.integer  "status_licensed_businesses"
    t.integer  "status_recycling_bins"
    t.integer  "status_restaurants"
    t.integer  "status_senior_centers"
    t.integer  "status_start_up_jobs"
    t.integer  "status_volunteer_opportunities"
    t.integer  "status_youth_programs"
  end

  create_table "gardens", :force => true do |t|
    t.string   "garden_name"
    t.string   "address"
    t.string   "neighborhoodname"
    t.string   "boro"
    t.float    "size"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "zip"
    t.integer  "game_zip_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "gov_jobs", :force => true do |t|
    t.string   "work_location"
    t.integer  "salary_range_to"
    t.integer  "salary_range_from"
    t.integer  "job_id"
    t.datetime "posting_date"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "licensed_businesses", :force => true do |t|
    t.string   "trade_name"
    t.string   "business_name"
    t.string   "full_address"
    t.integer  "zip_code"
    t.string   "industry"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "game_zip_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "recycling_bins", :force => true do |t|
    t.string   "park_site_name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "street_address"
    t.integer  "zip"
    t.string   "cuisine"
    t.datetime "inspection_date"
    t.string   "violation"
    t.string   "current_grade"
    t.integer  "game_zip_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "senior_centers", :force => true do |t|
    t.string   "program_name"
    t.string   "sponsor_name"
    t.string   "program_address"
    t.integer  "program_zipcode"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "game_zip_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "start_up_jobs", :force => true do |t|
    t.string   "company_name"
    t.string   "address"
    t.string   "hiring"
    t.integer  "zip"
    t.integer  "longitude"
    t.integer  "latitude"
    t.integer  "game_zip_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "password"
    t.string   "user_name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "volunteer_opportunities", :force => true do |t|
    t.string   "title"
    t.string   "org_title"
    t.string   "address"
    t.integer  "zip"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "game_zip_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "youth_programs", :force => true do |t|
    t.string   "program"
    t.string   "agency"
    t.string   "site_name"
    t.string   "grade_level_age_group"
    t.string   "address"
    t.integer  "zip"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "game_zip_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

end
