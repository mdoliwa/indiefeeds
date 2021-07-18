class FeedsController < ApplicationController
  def new
    @feed = Feed.new
  end

  def create
    CreateFeed.call(feed_url: feed_params[:url])

    redirect_to entries_path
  end

  private

  def feed_params
    params.require(:feed).permit(:url)
  end
end
