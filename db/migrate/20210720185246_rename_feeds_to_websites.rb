class RenameFeedsToWebsites < ActiveRecord::Migration[6.1]
  def change
    rename_table :feeds, :websites
  end
end
