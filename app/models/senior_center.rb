require 'open-uri'

class SeniorCenter < ActiveRecord::Base
  attr_accessible :program_name, :sponsor_name, :program_address, :program_zipcode, :lattitude, :longitude
  belongs_to :game_zip

  def self.make_senior_centers
    file = open('http://data.cityofnewyork.us/resource/6j6t-3ixh.json')
    parsed_file = JSON.parse(file.read)
    parsed_file.each do |center|
      center.each do |key, value|
        center.delete(key) unless SeniorCenter.column_names.include?(key)
      end
      SeniorCenter.new(center).save
    end
  end
end
