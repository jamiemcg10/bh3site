require "spec_helper"

describe SiteSectionsController do
  describe "routing" do

    it "routes to #index" do
      get("/site_sections").should route_to("site_sections#index")
    end

    it "routes to #new" do
      get("/site_sections/new").should route_to("site_sections#new")
    end

    it "routes to #show" do
      get("/site_sections/1").should route_to("site_sections#show", :id => "1")
    end

    it "routes to #edit" do
      get("/site_sections/1/edit").should route_to("site_sections#edit", :id => "1")
    end

    it "routes to #create" do
      post("/site_sections").should route_to("site_sections#create")
    end

    it "routes to #update" do
      put("/site_sections/1").should route_to("site_sections#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/site_sections/1").should route_to("site_sections#destroy", :id => "1")
    end

  end
end
