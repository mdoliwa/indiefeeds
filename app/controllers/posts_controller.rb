class PostsController < ApplicationController
  include Pagy::Backend

  def index
    @posts = Post.upvoted_by(current_user)
                 .includes(:website)
                 .order(published_at: :desc)

    @posts = @posts.where(website: website) if params[:website_id]

    @pagy, @posts = pagy(@posts)
  end
end
