module Users
  class CommentsController < ApplicationController
    def index
      @comments = User.find(params[:user_id]).comments.upvoted_by(current_user).order(created_at: :desc).arrange.keys

      render 'comments/index'
    end
  end
end
