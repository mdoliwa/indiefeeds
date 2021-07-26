class AddUpvotesCountToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :upvotes_count, :integer, default: 0
  end
end
