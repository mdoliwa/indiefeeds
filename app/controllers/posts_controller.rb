class PostsController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @posts = pagy(params[:website_id] ? WebsitePosts.call(params[:website_id]) : AllPosts.call, items: 25)
  end
end
