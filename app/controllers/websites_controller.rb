class WebsitesController < ApplicationController
  def index
    @websites = Website.all.includes(:feed)
  end
end

