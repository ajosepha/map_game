require "spec_helper"

describe GameZipsController do
  describe "routing" do

    it "routes to #index" do
      get("/game_zips").should route_to("game_zips#index")
    end

    it "routes to #new" do
      get("/game_zips/new").should route_to("game_zips#new")
    end

    it "routes to #show" do
      get("/game_zips/1").should route_to("game_zips#show", :id => "1")
    end

    it "routes to #edit" do
      get("/game_zips/1/edit").should route_to("game_zips#edit", :id => "1")
    end

    it "routes to #create" do
      post("/game_zips").should route_to("game_zips#create")
    end

    it "routes to #update" do
      put("/game_zips/1").should route_to("game_zips#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/game_zips/1").should route_to("game_zips#destroy", :id => "1")
    end

  end
end
