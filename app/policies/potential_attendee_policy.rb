class PotentialAttendeePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    # Only host should see every request
    puts "Checked index"
    @record.event.host == user
  end

  def create?
    user
  end

  def show?
    @record.event.host == user || user == @record.user
  end
end
