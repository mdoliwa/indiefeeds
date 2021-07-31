class UpvotesController < ApplicationController
  before_action :authorize!
  before_action :set_upvotable

  def create
    upvote = Upvote.new(user: current_user, upvotable: @upvotable)

    status = upvote.save ? :created : :forbidden

    head status
  end

  def destroy
    Upvote.find_by(user: current_user, upvotable: @upvotable).destroy!

    head :ok
  end

  private

  def set_upvotable
    @upvotable ||= if params[:post_id].present?
                     Post.find(params[:post_id])
                   elsif params[:comment_id].present?
                     Comment.find(params[:comment_id])
                   end
  end
end

