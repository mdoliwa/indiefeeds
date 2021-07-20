class WebsitePosts < Callable
  def initialize(id)
    @website = Website.find(id)
  end

  def call
    AllPosts.call.where(website: @website)
  end
end
