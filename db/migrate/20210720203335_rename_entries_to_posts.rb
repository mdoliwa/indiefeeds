class RenameEntriesToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_table :entries, :posts
  end
end
