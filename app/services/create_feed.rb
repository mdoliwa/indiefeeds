class CreateFeed < Callable
  def initialize(feed_url:)
    @feed_url = feed_url
  end

  def call
    feed = Feed.find_or_initialize_by(url: @feed_url)

    return unless feed.new_record? 

    feed.save!

    FetchNewFeedEntriesWorker.perform_async(feed.id)
  end
end
