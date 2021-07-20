class Website < ApplicationRecord
  has_many :posts

  def website_host
    URI.parse(feed_url).host.downcase
  end
end
