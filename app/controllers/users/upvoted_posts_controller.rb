module Users
  class UpvotedPostsController < ApplicationController
    include Pagy::Backend

    def index
      @posts = current_user ? Post.upvoted_by(current_user) : Post.all
      @posts = @posts.includes(:website).ranked
      @posts = @posts.joins(:upvotes).where(upvotes: { user_id: params[:user_id]})

      @pagy, @posts = pagy(@posts)

      render 'posts/index'
    end
  end
end
