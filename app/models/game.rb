class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :game_zip

  attr_reader :cultural_organizations, :community_health_centers

end
