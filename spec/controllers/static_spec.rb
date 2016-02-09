require "rails_helper"

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
  
  describe "GET #welcome with an index > 0" do
     it "responds successfully with an HTTP 200 status code" do
        get :welcome, :id => "1"
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "renders the welcome template" do
        get :welcome, :id => "1"
        expect(response).to render_template("welcome")
      end
  end
  
  describe "get_next_hash" do
    it "gets the next hash details from the google calendar" do
      @controller = StaticController.new
      hash = @controller.instance_eval{ get_next_hash(0) } 
      hash.should_not be_nil
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

end
