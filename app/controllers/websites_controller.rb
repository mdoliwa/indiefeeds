class WebsitesController < ApplicationController
  def new
    @website = Website.new
  end

  def create
    CreateWebsite.call(website_url: website_params[:url])

    redirect_to posts_path
  end

  private

  def website_params
    params.require(:website).permit(:url)
  end
end
