module Websites
  class PostsController < ApplicationController
    include Pagy::Backend

    def index
      @posts = Post.includes(:website)
        .upvoted_by(current_user)
        .where(website_id: params[:website_id])
        .where(hidden: false)
        .ranked

      @pagy, @posts = pagy(@posts)

      render 'posts/index'
    end
  end
end
