class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true

  scope :upvoted_by, -> (user) { joins("LEFT OUTER JOIN upvotes ON comments.id = upvotes.upvotable_id AND upvotes.upvotable_type = 'Comment' AND upvotes.user_id = #{user.id}").select('comments.*, (upvotes.id IS NOT NULL) AS upvoted') }

  has_ancestry
end
