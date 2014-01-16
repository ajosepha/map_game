require 'open-uri'

class GovJob < ActiveRecord::Base
  attr_accessible :work_location, :salary_range_to, :salary_range_from, :job_id
                  :posting_date

  belongs_to :neighborhood

    def self.make_gov_jobs

    file = open('http://data.cityofnewyork.us/resource/kpav-sd4t.json')
    parsed_file = JSON.parse(file.read)

    parsed_file.each do |govjob|

      g = GovJobs.new(govjob)
      g.save
    end
  end

end