module UsersHelper
    def user_is_member?
        current_user.member?
    end

    def downgrade_to_member
        current_user.role = "member"
        current_user.save
        redirect_to edit_user_registration_path(current_user)
    end
end