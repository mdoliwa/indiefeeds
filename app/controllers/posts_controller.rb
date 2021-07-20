class PostsController < ApplicationController
  def index
    @posts = params[:website_id] ? WebsitePosts.call(params[:website_id]) : AllPosts.call
  end
end
