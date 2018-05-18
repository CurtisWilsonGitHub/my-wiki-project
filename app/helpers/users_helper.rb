module UsersHelper
  def user_is_member?
    unless current_user.nil?
      current_user.member?
    end
  end

  def user_is_premium?
    unless current_user.nil?
      current_user.premium?
    end
  end

  def user_is_admin?
    unless current_user.nil?
      current_user.admin?
    end
  end
end
