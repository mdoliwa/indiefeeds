module Websites
  class PostsController < ApplicationController
    include Pagy::Backend

    def index
      @posts = Post.includes(:website)
        .upvoted_by(current_user)
        .ranked
        .where(website_id: params[:website_id])

      @pagy, @posts = pagy(@posts)

      render 'posts/index'
    end
  end
end
