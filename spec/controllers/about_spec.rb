require "rails_helper"

describe AboutController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
  
  describe "GET #history" do
    it "responds successfully with an HTTP 200 status code" do
      get :history
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the history template" do
      get :history
      expect(response).to render_template("history")
    end
  end
  
  describe "GET #mismanagement" do
    it "responds successfully with an HTTP 200 status code" do
      get :mismanagement
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the mismanagement template" do
      get :mismanagement
      expect(response).to render_template("mismanagement")
    end
  end
  
end
