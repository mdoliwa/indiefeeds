class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :url
      t.string :author
      t.datetime :published_at
      t.string :guid
      t.references :feed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
