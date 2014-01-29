class AddStatusToGames < ActiveRecord::Migration
  def change
    add_column :games, :status_community_health_centers, :integer
    add_column :games, :status_complaints, :integer
    add_column :games, :status_cultural_organizations, :integer
    add_column :games, :status_gardens, :integer
    add_column :games, :status_gov_jobs, :integer
    add_column :games, :status_licensed_businesses, :integer
    add_column :games, :status_recycling_bins, :integer
    add_column :games, :status_restaurants, :integer
    add_column :games, :status_senior_centers, :integer
    add_column :games, :status_start_up_jobs, :integer
    add_column :games, :status_volunteer_opportunities, :integer
    add_column :games, :status_youth_programs, :integer
  end
end
