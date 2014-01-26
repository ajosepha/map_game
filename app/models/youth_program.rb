class YouthProgram < ActiveRecord::Base
  attr_accessible :program, :agency, :site_name, :grade_level_age_group, :address, :zip, :longitude, :latitude, :game_zip
  belongs_to :game_zip

  def self.make_youth_programs
      file = open('http://data.cityofnewyork.us/resource/mbd7-jfnc.json')
      parsed_file = JSON.parse(file.read)
      temp = {}
      parsed_file.each do |program|
        program.each do |outer_key, outer_value|
          if outer_key == "location_1"
            outer_value.each do |inner_key, inner_value|
              if inner_key == "human_address"
                temp["zip"] == human_address["zip"]
                temp["address"] == human_address["address"]
              else
                unless inner_key.nil?
                  temp[inner_key] = inner_value if YouthProgram.column_names.include?(inner_key)
                end
              end
            end
          end
          
          temp[outer_key] = outer_value if YouthProgram.column_names.include?(outer_key)
        end
        YouthProgram.new(temp).save
      end
    end


end
