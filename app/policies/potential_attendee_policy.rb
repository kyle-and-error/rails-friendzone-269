class PotentialAttendeePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user
  end

  def create?
    user
  end

  def show?
    user_is_host? || user_is_guest?
  end

  def update?
    user_is_host?
  end

  private

  def user_is_host?
    @record.event.host == user
  end

  def user_is_guest?
    user == @record.user
  end
end
