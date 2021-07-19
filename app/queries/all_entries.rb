class AllEntries < Callable
  def call
    Entry.all.includes(:feed)
  end
end
