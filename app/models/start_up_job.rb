require 'open-uri'

class StartUpJob < ActiveRecord::Base
  belongs_to :neighborhood

  attr_accessible :company_name, :address, :hiring, :zip, :longitude, :latitude


  def self.make_start_up_jobs
    file = open('http://data.cityofnewyork.us/resource/f4yq-wry5.json')
    parsed_file = JSON.parse(file.read)

    parsed_file.each do |job|
      job.each do |key, value|
        job.delete(key) if !StartUpJob.column_names.include?(key)
      end
      StartUpJob.new(job).save
    end
  end


end

