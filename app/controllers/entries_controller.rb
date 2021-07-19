class EntriesController < ApplicationController
  def index
    @entries = Entry.all.includes(:feed)
  end
end
