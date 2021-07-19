class FetchNewFeedEntries < Callable
  def initialize(feed)
    @feed = feed
  end

  def call
    xml = URI.open(@feed.url).read
    entries = Feedjira.parse(xml).entries
    guids = @feed.entries.pluck(:guid)
    new_entries = entries.reject { |entry| guids.include?(entry.entry_id) }

    new_entries.map do |entry|
      {
        guid: entry.entry_id,
        title: entry.title,
        url: entry.url,
        author: entry.author,
        published_at: entry.published,
        feed_id: @feed.id
      }
    end
  end
end
