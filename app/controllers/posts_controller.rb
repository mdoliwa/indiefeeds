class PostsController < ApplicationController
  include Pagy::Backend

  def index
    @posts = current_user ? Post.upvoted_by(current_user) : Post.all
    @posts = @posts.includes(:website).ranked
    @posts = @posts.where(website: website) if params[:website_id]

    @pagy, @posts = pagy(@posts)
  end
end
