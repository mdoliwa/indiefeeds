class Feed < ApplicationRecord
  belongs_to :website, optional: true

  def new_entries
    guids = website.posts.pluck(:guid)

    entries
      .reject { |entry| guids.include?(entry[:guid]) }
      .map do |entry|
        {
          guid: entry[:guid],
          title: entry[:title],
          url: entry[:url],
          author: entry[:author],
          published_at: entry[:published_at],
        }
      end

  end

  def entries
    source.entries.map do |entry|
      {
        guid: entry.entry_id,
        title: entry.title,
        url: entry.url,
        author: entry.author,
        published_at: entry.published
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
end
