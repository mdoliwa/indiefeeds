class NewPostsController < ApplicationController
  include Pagy::Backend

  def index
    @posts = Post.includes(:website).upvoted_by(current_user).order(published_at: :desc)

    @pagy, @posts = pagy(@posts)

    render 'posts/index'
  end
end
