class ScheduleFetchingFeedEntriesWorker
  include Sidekiq::Worker

  def perform
    Feed.all.each.with_index { |feed, index| FetchNewEntriesWorker.perform_in(index.minutes, feed.id) }
  end
end


