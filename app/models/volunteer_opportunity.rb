require 'open-uri'
class VolunteerOpportunity < ActiveRecord::Base
  attr_accessible :title, :org_title, :address, :zip, :latitude, :longitude
  belongs_to :game_zip

  def self.make_volunteer_opportunities
    file = open('http://data.cityofnewyork.us/resource/bquu-z2ht.json')
    parsed_file = JSON.parse(file.read)
    temp = {}
    parsed_file.each do |opportunity|
      opportunity.each do |outer_key, outer_value|
        if outer_key == "locality"
          outer_value.each do |inner_key, inner_value|
            if inner_key == "human_address"
              address_hash = JSON.parse(inner_value)
              temp["zip"] = address_hash["zip"]
              temp["address"] = address_hash["address"]
            else
              unless inner_key.nil?
                temp[inner_key] = inner_value if VolunteerOpportunity.column_names.include?(inner_key)
              end
            end
          end
        end
        temp[outer_key] = outer_value if VolunteerOpportunity.column_names.include?(outer_key)
      end
      VolunteerOpportunity.new(temp).save if opportunity["recurrence_type"]== "ongoing"
    end
  end
end


# class CulturalOrganization < ActiveRecord::Base
#   attr_accessible :discipline_code, :longitude, :latitude, :human_address, :organization_name

#   belongs_to :neighborhood

#   def self.make_cultural_organizations
#     file = open('http://data.cityofnewyork.us/resource/w6ua-xz2g.json')
#     parsed_file = JSON.parse(file.read)
#     temp = {}

#     parsed_file.each do |org|
#       org.each do |outer_key, outer_value|
#         if outer_key == "location_1"
#           outer_value.each do |inner_key, inner_value|
#             if !inner_key.nil?
#               temp[inner_key] = inner_value if CulturalOrganization.column_names.include?(inner_key)
#             end
#           end
#         end
#         temp[outer_key] = outer_value if CulturalOrganization.column_names.include?(outer_key)
#         #org.delete(outer_key) if !CulturalOrganization.column_names.include?(outer_key)
#       end  
#       CulturalOrganization.new(temp).save 
#     end
#   end