class FeedsController < ApplicationController
  def new
    @feed = Feed.new
  end

  def create
    CreateFeed.call(feed_url: feed_params[:url])

    redirect_to new_feed_path
  end

  private

  def feed_params
    params.require(:feed).permit(:url)
  end
end
