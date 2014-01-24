require 'open-uri'

class CommunityHealthCenter < ActiveRecord::Base
  attr_accessible :zip, :center_address, :name_of_center
  belongs_to :game_zip

  def self.make_community_health_centers
    file = open('http://data.cityofnewyork.us/resource/b2sp-asbg.json')
    parsed_file = JSON.parse(file.read)

    parsed_file.each do |center|
      center.delete("telephone_number")
      center.delete("__name_of_borough")

      g = CommunityHealthCenter.new(center)
      g.save
    end
  end

end