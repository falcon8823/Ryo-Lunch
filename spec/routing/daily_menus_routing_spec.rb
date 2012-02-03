require "spec_helper"

describe DailyMenusController do
  describe "routing" do

    it "routes to #index" do
      get("/daily_menus").should route_to("daily_menus#index")
    end

    it "routes to #new" do
      get("/daily_menus/new").should route_to("daily_menus#new")
    end

    it "routes to #show" do
      get("/daily_menus/1").should route_to("daily_menus#show", :id => "1")
    end

    it "routes to #edit" do
      get("/daily_menus/1/edit").should route_to("daily_menus#edit", :id => "1")
    end

    it "routes to #create" do
      post("/daily_menus").should route_to("daily_menus#create")
    end

    it "routes to #update" do
      put("/daily_menus/1").should route_to("daily_menus#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/daily_menus/1").should route_to("daily_menus#destroy", :id => "1")
    end

  end
end
