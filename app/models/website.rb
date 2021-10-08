class Website < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_one :feed, dependent: :destroy

  def website_host
    URI.parse(url).host.downcase
  end
end
