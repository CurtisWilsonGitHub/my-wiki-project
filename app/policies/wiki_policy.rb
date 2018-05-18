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

  class Scope
  attr_reader :user, :scope

  def initialize(user, scope)
    @user = user
    @scope = scope
  end

  def resolve
    wikis = []
    unless user.nil?
      if user.admin?
        wikis = scope.all # if the user is an admin, show them all the wikis
      elsif user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.private? == false || wiki.user_id == user.id ||  wiki.users.include?(user)
            wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
          end
        end
      else # this is the lowly standard user
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if wiki.private? == false || wiki.users.include?(user)
            wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
          end
        end
      end
    else
      all_wikis = scope.all
      wikis = []
      all_wikis.each do |wiki|
        if wiki.private? == false
          wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
        end
      end
    end
    wikis # return the wikis array we've built up
  end
end
end


#ask mentor why wiki.collaborators.include? doesn't work in
