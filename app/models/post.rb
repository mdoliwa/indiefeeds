class Post < ApplicationRecord
  belongs_to :website
  has_many :upvotes

  scope :upvoted_by, -> (user) { joins("LEFT OUTER JOIN upvotes ON posts.id = upvotes.post_id AND upvotes.user_id = #{user.id}").select('posts.*, (upvotes.id IS NOT NULL) AS upvoted') }
end
