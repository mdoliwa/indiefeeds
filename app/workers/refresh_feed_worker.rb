class RefreshFeedWorker
  include Sidekiq::Worker

  def perform(feed_id)
    feed = Feed.find(feed_id)
    feed.website ||= Website.new 

    feed.website.update(feed.website_params)
    feed.website.posts.create(feed.new_entries)
  end
end

