class UpdateWebsiteWorker
  include Sidekiq::Worker

  def perform(id)
    website = Website.find(id)

    feed = Feed.new(website)

    website.update(feed.website_params)
  end
end
