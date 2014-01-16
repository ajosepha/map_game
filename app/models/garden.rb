require 'open-uri'

class Garden < ActiveRecord::Base

  belongs_to :neighborhood

  def self.make_gardens

    file = open('http://data.cityofnewyork.us/resource/ajxm-kzmj.json')
    parsed_file = JSON.parse(file.read)

    parsed_file.each do |garden|
      garden.delete("propid") #=> and others
      g = Garden.new(garden)
     g.save
    end
    

  end

end
