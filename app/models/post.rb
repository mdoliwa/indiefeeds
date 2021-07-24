class Post < ApplicationRecord
  belongs_to :website
  has_many :upvotes

  scope :with_upvotes, -> (user) { joins("LEFT OUTER JOIN upvotes ON posts.id = upvotes.post_id AND upvotes.user_id = #{user.id}") }
end
