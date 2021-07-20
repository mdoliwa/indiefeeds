class UpdateWebsiteUrlWorker
  include Sidekiq::Worker

  def perform(id)
    website = Website.find(id)
    website_url = FetchWebsiteUrl.call(website)

    website.update(url: website_url)
  end
end
