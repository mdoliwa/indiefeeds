class PostsController < ApplicationController
  include Pagy::Backend

  def index
    @posts = Post.all.includes(:website).with_upvotes(current_user)
             .select('posts.*, (upvotes.id IS NOT NULL) AS upvoted')
             .order(published_at: :desc)

    @posts = @posts.where(website: website) if params[:website_id]

    @pagy, @posts = pagy(@posts)
  end
end
