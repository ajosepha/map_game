require 'open-uri'

class Complaint < ActiveRecord::Base
  attr_accessible :created_date, :closed_date, :complaint_type, :descriptor, :incident_address, :latitude, :longitude

  belongs_to :neighborhood

  def self.make_complaints
    file = open('http://data.cityofnewyork.us/resource/erm2-nwe9.json')
    parsed_file = JSON.parse(file.read)
    parsed_file.each do |complaint|
      complaint.each do |key, value|
        complaint.delete(key) if !Complaint.column_names.include?(key)
      end
      g = Complaint.new(complaint)
      g.save
    end
  end


end