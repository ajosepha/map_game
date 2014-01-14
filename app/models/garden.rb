class Garden < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :neighborhood
end
