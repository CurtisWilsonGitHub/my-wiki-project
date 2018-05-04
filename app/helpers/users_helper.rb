module UsersHelper
    def user_is_member?
        current_user.member?
    end

    def user_is_premium?
      current_user.premium?
    end

    def user_is_admin?
      current_user.admin?
    end 
end
