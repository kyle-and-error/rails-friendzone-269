class PotentialAttendeePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    # Only host should see every request
    user_is_host?
  end

  def create?
    user
  end

  def show?
    user_is_host? || user_is_guest?
  end

  private

  def user_is_host?
    @record.event.host == user
  end

  def user_is_guest?
    user == @record.user
  end
end
