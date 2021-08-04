module Users
  class UpvotedPostsController < ApplicationController
    include Pagy::Backend

    def index
      @posts = Post.includes(:website)
                   .upvoted_by(current_user)
                   .ranked
                   .joins(:upvotes)
                   .where(upvotes: { user_id: params[:user_id]})
                   .order('upvotes.created_at DESC')

      @pagy, @posts = pagy(@posts)

      render 'posts/index'
    end
  end
end
