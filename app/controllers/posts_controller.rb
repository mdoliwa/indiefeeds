class PostsController < ApplicationController
  include Pagy::Backend

  def index
    @posts = Post.includes(:website).upvoted_by(current_user).ranked
    @posts = @posts.where(website: website) if params[:website_id]

    @pagy, @posts = pagy(@posts)
  end

  def show
    @post = Post.upvoted_by(current_user).find(params[:id])
  end
end
