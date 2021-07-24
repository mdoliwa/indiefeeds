class UpvotesController < ApplicationController
  before_action :authorize!

  def create
    upvote = Upvote.new(user: current_user, post_id: params[:post_id])

    status = upvote.save ? :created : :forbidden

    head status
  end

  def destroy
    Upvote.find_by(user: current_user, post_id: params[:post_id]).destroy!

    head :ok
  end
end

