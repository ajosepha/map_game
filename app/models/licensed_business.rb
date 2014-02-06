require 'open-uri'

class LicensedBusiness < ActiveRecord::Base
  attr_accessible :full_address, :zip_code, :business_name, :trade_name, :industry
  
  belongs_to :game_zip


  def self.make_licensed_businesses
    file = open('http://data.cityofnewyork.us/resource/spgx-ssye.json')
    parsed_file = JSON.parse(file.read)
    parsed_file.each do |business|
      nil_flag = false
      business.each do |key, value|
        business.delete(key) unless LicensedBusiness.column_names.include?(key)
        unless value == "trade_name"
          nil_flag = true if LicensedBusiness.column_names.include?(key) && value == 'nil'
        end
      end
      LicensedBusiness.new(business).save unless nil_flag
    end
  end
end
