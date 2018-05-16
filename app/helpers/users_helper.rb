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

    def list_emails
      #this work but I have no idea what it does. Ask mentor
      User.connection.select_values(User.select("email").to_sql)
    end
end
