class AllEntries < Callable
  def call
    Entry.all.includes(:feed).order(published_at: :desc)
  end
end
