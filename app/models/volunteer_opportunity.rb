class VolunteerOpportunity < ActiveRecord::Base
  belongs_to :neighborhood
  attr_accessible :title, :latitude, :longitude, :human_address

  def self.make_volunteer_opportunities
    file = open('http://data.cityofnewyork.us/resource/bquu-z2ht.json')
    parsed_file = JSON.parse(file.read)
    parsed_file.each do |opportunity|
      opportunity["locality"].each do |key, value|
        if !VolunteerOpportunity.column_names.include?(key)
          opportunity.delete(key)
        else
          opportunity[key] = value
        end
      end
      opportunity.each do |key, value|
        opportunity.delete(key) if !VolunteerOpportunity.column_names.include?(key)
      end
    VolunteerOpportunity.new(opportunity).save
  end
end