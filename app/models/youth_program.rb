class YouthProgram < ActiveRecord::Base
  # attr_accessible :title, :body

  def self.make_volunteer_opportunities
      file = open('http://data.cityofnewyork.us/resource/mbd7-jfnc.json')
      parsed_file = JSON.parse(file.read)
      temp = {}
      parsed_file.each do |opportunity|
        opportunity.each do |outer_key, outer_value|
          if outer_key == "location_1"
            outer_value.each do |inner_key, inner_value|
              unless inner_key.nil?
                temp[inner_key] = inner_value if VolunteerOpportunity.column_names.include?(inner_key)
              end
            end
          end
          
          temp[outer_key] = outer_value if VolunteerOpportunity.column_names.include?(outer_key)
        end
        VolunteerOpportunity.new(temp).save 
      end
    end


end
