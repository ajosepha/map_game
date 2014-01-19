require 'open-uri'

class CulturalOrganization < ActiveRecord::Base
  attr_accessible :discipline_code, :longitude, :latitude, :human_address, :organization_name

  belongs_to :neighborhood

  def self.make_cultural_organizations
    file = open('http://data.cityofnewyork.us/resource/w6ua-xz2g.json')
    parsed_file = JSON.parse(file.read)
  end


    # b = []
    # #b is an array of hashes
    # parsed_file.each do |org|
    #   b << org["location_1"]
    # end

    #  b.each do |array|
    #   array.each do |hash|
    #     hash.delete("needs_recoding")
    #   end
    # end
    #   loc_hash.delete_if{ |key, value| key == "needs_recoding"}
    # end
  # end
    #   #like calling first
    #   array.each do |element|
    #     element.delete("needs_recoding")
    #   end
    # end
    #     element.each do |key, value|
    #       element.delete(key) if key == "needs_recoding"
    #     end
    #  end
    # end
    #this works but throws an error into IRB

        




#rails generate migration CreateCulturalOrganization
end


