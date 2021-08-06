class CreateWebsiteFeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :feeds do |t|
      t.string :url
      t.references :website, null: true, foreign_key: true

      t.timestamps
    end
  end
end
