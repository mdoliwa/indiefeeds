class FetchNewFeedEntries
  include Sidekiq::Worker

  def perform
    Feed.all.each { |feed| feed.website.posts.create(feed.new_entries) }
  end
end


