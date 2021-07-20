require 'open-uri'

class FetchWebsiteUrl < Callable
  def initialize(website)
    @website = website
  end

  def call
    Feed.for(@website).website_url
  end
end
