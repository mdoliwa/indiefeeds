class UpvotesController < ApplicationController
  before_action :authorize!

  def create
    Upvote.create!(user: current_user, post_id: params[:post_id]) 
  end

  def destroy
    Upvote.find_by(user: current_user, post_id: params[:post_id]).destroy!
  end
end

