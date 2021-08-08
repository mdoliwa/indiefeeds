class FeedsController < ApplicationController
  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)
    return render :new unless @feed.save

    RefreshWebsiteWorker.perform_async(@feed.id)
    redirect_to root_path
  end

  private

  def feed_params
    params.require(:feed).permit(:url)
  end
end
