class RenameFeedIdToWebsiteIdInEntries < ActiveRecord::Migration[6.1]
  def change
    rename_column :entries, :feed_id, :website_id
  end
end
