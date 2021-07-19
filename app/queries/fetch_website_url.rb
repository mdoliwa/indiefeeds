require 'open-uri'

class FetchWebsiteUrl < Callable
  def initialize(feed)
    @feed = feed
  end

  def call
    xml = URI.open(@feed.url).read
    
    Feedjira.parse(xml).url
  end
end
