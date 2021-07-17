require 'open-uri'

class FetchNewFeedEntries < Callable
  def initialize(feed)
    @feed = feed
  end

  def call
    xml = URI.open(@feed.url).read

    Feedjira.parse(xml).entries.map do |entry|
      @feed.entries.find_or_initialize_by(
        guid: entry.entry_id,
        title: entry.title,
        url: entry.url,
        author: entry.author,
        published_at: entry.published,
        guid: entry.entry_id
      )
    end.select(&:new_record?).map(&:attributes).map(&:compact)
  end
end
