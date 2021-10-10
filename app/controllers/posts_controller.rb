class PostsController < ApplicationController
  include Pagy::Backend

  def index
    @posts = Post.includes(:website).upvoted_by(current_user).where(hidden: false).ranked

    @pagy, @posts = pagy(@posts)
  end

  def show
    @post = Post.upvoted_by(current_user).find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    @post.update(post_params)

    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:hidden)
  end
end
