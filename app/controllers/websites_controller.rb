class WebsitesController < ApplicationController
  include Pagy::Backend

  def index
    @websites = Website.all.includes(:feed)

    @pagy, @websites = pagy(@websites)
  end
end

