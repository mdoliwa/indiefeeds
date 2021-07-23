class UpvotePolicy < ApplicationPolicy
  def create?
    user.presence
  end

  def destroy?
    user.presence
  end
end
