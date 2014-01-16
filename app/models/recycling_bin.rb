require 'open-uri'

class RecyclingBin < ActiveRecord::Base
  attr_accessible :park_site_name, :latitude, :longitude

  belongs_to :neighborhood

  def self.make_recycling_bins
    file = open('http://data.cityofnewyork.us/resource/sxx4-xhzg.json')
    parsed_file = JSON.parse(file.read)
    parsed_file.each do |bin|
      bin.each do |key, value|
        bin.delete(key) if !RecyclingBin.column_names.include?(key)
      end
      RecyclingBin.new(bin).save
    end
  end


end
