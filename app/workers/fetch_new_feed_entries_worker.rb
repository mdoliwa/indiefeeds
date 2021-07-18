class FetchNewFeedEntriesWorker
  include Sidekiq::Worker

  def perform(id)
    feed = Feed.find(id)

    Entry.create(FetchNewFeedEntries.call(feed))
  end
end
