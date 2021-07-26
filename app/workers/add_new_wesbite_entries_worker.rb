class AddNewWebsiteEntriesWorker
  include Sidekiq::Worker

  def perform(id)
    website = Website.find(id)
    new_posts = FetchNewWebsiteEntries.call(website)

    posts = Post.create(new_posts)
  end
end
