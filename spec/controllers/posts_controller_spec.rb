require "rails_helper"

describe PostsController do
  describe "GET 'index'" do
    it "returns http success" do
      get :index

      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    
    it "returns http success for a page" do
      get :index, :params => {:page_number => 2} 

      expect(response).to be_success
      expect(response.status).to eq(200)
    end    
  end
  
  describe "get_posts_for_page" do
    it "gets posts from the rss feed for a given page" do
      @controller = PostsController.new
      posts = @controller.instance_eval{ get_posts_for_page(1) } 
      
      expect(posts).not_to be_nil
      expect(posts.length).to eq 5
    end
  end
end
