class AddNewFeedEntriesWorker
  include Sidekiq::Worker

  def perform(id)
    feed = Feed.find(id)
    new_entries = FetchNewFeedEntries.call(feed)

    Entry.create(new_entries)
  end
end
