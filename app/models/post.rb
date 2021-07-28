class Post < ApplicationRecord
  belongs_to :website
  has_many :upvotes
  has_many :comments

  scope :upvoted_by, -> (user) { joins("LEFT OUTER JOIN upvotes ON posts.id = upvotes.post_id AND upvotes.user_id = #{user.id}").select('posts.*, (upvotes.id IS NOT NULL) AS upvoted') }

  scope :ranked, -> { select('posts.*, ((posts.upvotes_count + 1) / POWER(EXTRACT(EPOCH FROM (NOW() - posts.published_at)), 1.8)) AS rank').order('rank DESC') }
end
