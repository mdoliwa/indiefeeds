class FetchNewEntriesWorker
  include Sidekiq::Worker

  def perform(feed_id)
    feed = Feed.find(feed_id)

    feed.website.posts.create(feed.new_entries)
  end
end
