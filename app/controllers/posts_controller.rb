class PostsController < ApplicationController
  include Pagy::Backend

  def index
    @posts = Post.includes(:website).upvoted_by(current_user).ranked

    @pagy, @posts = pagy(@posts)
  end

  def show
    @post = Post.upvoted_by(current_user).find(params[:id])
  end
end
