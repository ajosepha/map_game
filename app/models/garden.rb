require 'open-uri'

class Garden < ActiveRecord::Base
  attr_accessible :garden_name, :address, :boro, :size, :latitude, :longitude, :neighborhoodname
  belongs_to :neighborhood

  def self.make_gardens

    file = open('http://data.cityofnewyork.us/resource/ajxm-kzmj.json')
    parsed_file = JSON.parse(file.read)

    parsed_file.each do |garden|
      garden.delete("cross_streets")
      garden.delete("council_district")
      garden.delete("propid")
      garden.delete("jurisdiction")
      garden.delete("community_board")
      g = Garden.new(garden)
      g.save
    end
  end

end
