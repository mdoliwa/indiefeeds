class UpdateWebsiteUrlWorker
  include Sidekiq::Worker

  def perform(id)
    feed = Feed.find(id)
    website_url = FetchWebsiteUrl.call(feed)

    feed.update(website_url: website_url)
  end
end
