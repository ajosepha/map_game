class Neighborhood < ActiveRecord::Base
  has_many :gardens
  has_many :laundromats

end