class FeedPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def create?
    user&.admin?
  end
end
