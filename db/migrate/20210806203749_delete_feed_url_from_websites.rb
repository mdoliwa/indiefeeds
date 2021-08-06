class DeleteFeedUrlFromWebsites < ActiveRecord::Migration[6.1]
  def change
    remove_column :websites, :feed_url
  end
end
