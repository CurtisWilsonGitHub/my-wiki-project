module UsersHelper
    def user_is_member?
        current_user.member?
    end
end