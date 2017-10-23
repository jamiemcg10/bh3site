require "rails_helper"

describe StaticController do
  shared_examples "it responds with success" do
    it { should respond_with :success }
  end

  shared_examples "it renders the welcome template" do
    it { should render_template "welcome" }
  end

  describe "GET #welcome" do
    before { get :welcome }

    it_behaves_like "it responds with success"
    it_behaves_like "it renders the welcome template"

    context "passing an id param to get a specific index" do
      before { get :welcome, params: { id: "1" } }

      it_behaves_like "it responds with success"
      it_behaves_like "it renders the welcome template"
    end
  end
  
  describe "GET #calendar" do
    before { get :calendar }

    it_behaves_like "it responds with success"
    it { should render_template "calendar" }
  end

  describe "get_next_hash" do
    it "gets the next hash details from the google calendar" do
      @controller = StaticController.new
      hash = @controller.instance_eval{ get_next_hash(0) } 
      expect(hash).not_to be_nil
    end  
  end
end
