require "spec_helper"

describe ZipsController do
  describe "routing" do

    it "routes to #index" do
      get("/zips").should route_to("zips#index")
    end

    it "routes to #new" do
      get("/zips/new").should route_to("zips#new")
    end

    it "routes to #show" do
      get("/zips/1").should route_to("zips#show", :id => "1")
    end

    it "routes to #edit" do
      get("/zips/1/edit").should route_to("zips#edit", :id => "1")
    end

    it "routes to #create" do
      post("/zips").should route_to("zips#create")
    end

    it "routes to #update" do
      put("/zips/1").should route_to("zips#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/zips/1").should route_to("zips#destroy", :id => "1")
    end

  end
end
