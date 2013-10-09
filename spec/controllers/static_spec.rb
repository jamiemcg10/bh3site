require "spec_helper"

describe StaticController do
  describe "GET #welcome" do
    it "responds successfully with an HTTP 200 status code" do
      get :welcome
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the welcome template" do
      get :welcome
      expect(response).to render_template("welcome")
    end
  end
  
  describe "GET #calendar" do
    it "responds successfully with an HTTP 200 status code" do
      get :calendar
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the calendar template" do
      get :calendar
      expect(response).to render_template("calendar")
    end
  end
  
  describe "GET #events" do
    it "responds successfully with an HTTP 200 status code" do
      get :events
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the events template" do
      get :events
      expect(response).to render_template("events")
    end
  end
  
  describe "GET #more" do
    it "responds successfully with an HTTP 200 status code" do
      get :more
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the more info template" do
      get :more
      expect(response).to render_template("more")
    end
  end
end