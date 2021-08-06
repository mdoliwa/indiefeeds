class Website < ApplicationRecord
  has_many :posts
  has_one :feed

  def website_host
    URI.parse(url).host.downcase
  end
end
