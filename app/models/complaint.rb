require 'open-uri'

class Complaint < ActiveRecord::Base
  attr_accessible :created_date, :closed_date, :complaint_type, :descriptor, :incident_address, :incident_zip, :latitude, :longitude

  belongs_to :game_zip

  def self.make_complaints
    file = open('http://data.cityofnewyork.us/resource/erm2-nwe9.json')
    parsed_file = JSON.parse(file.read)
    two_months_ago = 2.month.ago
    parsed_file.each do |complaint|
      recent = false
      complaint.each do |key, value|
        recent = true if key == "created_date" && Time.parse(value) > two_months_ago
        complaint.delete(key) if !Complaint.column_names.include?(key)
      end
      Complaint.new(complaint).save if recent
    end
  end


end