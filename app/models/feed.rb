class Feed < ApplicationRecord
  has_many :entries

  def website_host
    URI.parse(url).host.downcase
  end
end
