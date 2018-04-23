class WikiPolicy < ApplicationPolicy
  
  
  def show?
    true
  end

  def create?
    unless user.nil?
      user.member? || user.admin?
    end
  end

  def update?
    unless user.nil?
      user.member? || user.admin?
    end
  end

  def destroy?
    unless user.nil?
      user.member? || user.admin?
    end
  end
  
  class Scope < Scope
    def resolve
      scope
    end
  end
end
