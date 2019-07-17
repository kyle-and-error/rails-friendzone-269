class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index?
    true
  end

  def show?
    true
  end

  # Inherited
  # def new?
  #   create?
  # end

  def create?
    user
  end
end
