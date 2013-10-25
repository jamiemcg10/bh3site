require 'rss'
class PostsController < ApplicationController
  def index
    params["page_number"] ||= "1"
    @page_number = params["page_number"].to_i
    @posts = get_posts_for_page(@page_number)
  end
  
  private
  def get_posts_for_page(page)
      start_index = ((page - 1) * 5) + 1 
      @rss_url = 'http://bostonhash.blogspot.com/feeds/posts/default?alt=rss&max-results=5&start-index=' + start_index.to_s
      begin
          latest_blog_posts = RSS::Parser.parse(open(@rss_url).read, false).items
        rescue => error
          # Do nothing, just continue.  The view will skip the blog section if the feed is nil.
          latest_blog_posts = nil
        end
      return latest_blog_posts
  end
end
