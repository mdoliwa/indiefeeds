class RenameUrlToFeedUrlInWebsites < ActiveRecord::Migration[6.1]
  def change
    rename_column :websites, :url, :feed_url
  end
end
