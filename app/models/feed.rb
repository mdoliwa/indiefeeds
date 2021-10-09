class Feed < ApplicationRecord
  belongs_to :website, optional: true

  validates :url, uniqueness: true

  def new_entries
    guids = website.posts.pluck(:guid)

    source
      .entries
      .reject { |entry| guids.include?(entry.entry_id) }
      .map do |entry|
        {
          guid: entry.entry_id,
          title: entry.title,
          url: entry_url(entry),
          author: entry.author,
          published_at: entry.published,
        }
      end
  end

  def website_params
    {
      url: source.url,
      title: source.title,
      description: source.description
    }
  end

  private

  def source
    @source ||= Feedjira.parse(
      URI.open(url).read
    )
  end

  def entry_url(entry)
    URI.parse(entry.url).host.presence || URI.join(website.host, entry.url).to_s
  end
end
