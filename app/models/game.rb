class Game < ActiveRecord::Base
  belongs_to :user
  has_one :neighborhood
  # attr_accessible :title, :body
end
