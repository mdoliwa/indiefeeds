class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :upvotable, counter_cache: true, polymorphic: true

  validates :user, uniqueness: { scope: :upvotable }
end
