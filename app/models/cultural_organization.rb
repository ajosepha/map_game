require 'open-uri'

class CulturalOrganization < ActiveRecord::Base
  attr_accessible :discipline_code, :longitude, :latitude, :human_address, :organization_name

  belongs_to :neighborhood

  def self.make_cultural_organizations
    file = open('http://data.cityofnewyork.us/resource/w6ua-xz2g.json')
    parsed_file = JSON.parse(file.read)
    parsed_file.each do |org|
      org.each do |key, value|
         org.delete(key) if !CulturalOrganization.column_names.include?(key)
        # org.delete(key) if !CulturalOrganization.column_names.include?(key)
        # if key == 'location_1' do |inner_key, inner_value|
          
        #end
      #end
    end
  end
end


#rails generate migration CreateCulturalOrganization
end


