class FeedEntries < Callable
  def initialize(id)
    @feed = Feed.find(id)
  end

  def call
    AllEntries.call.where(feed: @feed)
  end
end
