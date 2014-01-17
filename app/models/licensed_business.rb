require 'open-uri'

class LicensedBusiness < ActiveRecord::Base
  attr_accessible :full_address, :business_name, :trade_name, :industry
  
  belongs_to :neighborhood


  def self.make_licensed_businesses
    file = open('http://data.cityofnewyork.us/resource/spgx-ssye.json')
    parsed_file = JSON.parse(file.read)
    parsed_file.each do |business|
      business.each do |key, value|
        business.delete(key) if !LicensedBusiness.column_names.include?(key)
      end
      LicensedBusiness.new(business).save
    end
  end
end


