require 'open-uri'

class Feed
  def initialize(website)
    @website = website
  end

  def entries
    feed.entries.map do |entry|
      OpenStruct.new(
        guid: entry.entry_id,
        title: entry.title,
        url: entry.url,
        author: entry.author,
        published_at: entry.published,
        website_id: @website.id
      )
    end
  end

  def website_params
    {
      url: feed.url,
      title: feed.title,
      description: feed.description
    }
  end

  private

  def feed
    @feed ||= Feedjira.parse(
      URI.open(@website.feed_url).read
    )
  end
end
