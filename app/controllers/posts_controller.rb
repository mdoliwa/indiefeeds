class PostsController < ApplicationController
  include Pagy::Backend

  def index
    @posts = Post.all.includes(:website).order(published_at: :desc)
    @posts = @posts.where(website: website) if params[:website_id]

    @pagy, @posts = pagy(@posts)
  end
end
