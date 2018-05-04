class WikiPolicy < ApplicationPolicy


  def show?
    true
  end

  def create?
    unless user.nil?
      user.member? || user.admin? || user.premium?
    end
  end

  def update?
    unless user.nil?
      user.member? || user.admin? || user.premium?
    end
  end

  def destroy?
    unless user.nil?
      user.member? || user.admin? || user.premium?
    end
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
