class AllPosts < Callable
  def call
    Post.all.includes(:website).order(published_at: :desc)
  end
end
