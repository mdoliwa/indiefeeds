class RenameWebsiteUrlToUrlInWebsites < ActiveRecord::Migration[6.1]
  def change
    rename_column :websites, :website_url, :url
  end
end
