require 'open-uri'

class CulturalOrganization < ActiveRecord::Base
  attr_accessible :discipline_code, :longitude, :latitude, :human_address, :organization_name

  belongs_to :neighborhood

  def self.make_cultural_organizations
    file = open('http://data.cityofnewyork.us/resource/w6ua-xz2g.json')
    parsed_file = JSON.parse(file.read)



    b = []
    #b is an array of hashes
    parsed_file.each do |org|
      b << org["location_1"]
    end

    #this works but gives me an error
    b.each do |array|
      array.delete("location_1")
    end

    #  b.each do |array|
    #   array.each do |hash|
    #     hash.delete("needs_recoding")
    #   end
    # end
  end

end


        






