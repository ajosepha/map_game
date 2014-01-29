class Game < ActiveRecord::Base
  belongs_to :user
  has_many :game_zips

  attr_reader :cultural_organizations, :community_health_centers

end
