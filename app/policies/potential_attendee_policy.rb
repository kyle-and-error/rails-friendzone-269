class PotentialAttendeePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    # Only host should see every request
    user == @record.host
  end
end
