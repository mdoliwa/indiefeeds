class CreateWebsite < Callable
  def initialize(website_url:)
    @website_url = website_url
  end

  def call
    website = Website.find_or_initialize_by(url: @website_url)

    return unless website.new_record? 

    website.save!

    UpdateWebsiteUrlWorker.perform_async(website.id)
    AddNewWebsiteEntriesWorker.perform_async(website.id)
  end
end
