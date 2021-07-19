class AddWebsiteUrlToFeeds < ActiveRecord::Migration[6.1]
  def change
    add_column :feeds, :website_url, :string
  end
end
