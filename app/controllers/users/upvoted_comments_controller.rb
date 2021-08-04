module Users
  class UpvotedCommentsController < ApplicationController
    def index
      @comments = Comment.upvoted_by(current_user)
                         .joins(:upvotes)
                         .where(upvotes: { user_id: params[:user_id]})
                         .order('upvotes.created_at DESC')
                         .arrange
                         .keys

      render 'comments/index'
    end
  end
end

