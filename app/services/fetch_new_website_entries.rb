class FetchNewWebsiteEntries < Callable
  def initialize(website)
    @website = website
  end

  def call
    guids = @website.entries.pluck(:guid)

    Feed.new(@website).entries
      .reject { |entry| guids.include?(entry.guid) }
      .map do |entry|
      {
        guid: entry.guid,
        title: entry.title,
        url: entry.url,
        author: entry.author,
        published_at: entry.published,
        website_id: @website.id
      }
    end
  end
end
