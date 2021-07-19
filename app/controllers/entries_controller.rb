class EntriesController < ApplicationController
  def index
    @entries = params[:feed_id] ? FeedEntries.call(params[:feed_id]) : AllEntries.call
  end
end
