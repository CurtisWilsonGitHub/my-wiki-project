class UsersController < ApplicationController

    def list_emails
      @users = User.all
    end

    def downgrade
      if current_user.id == params[:user_id].to_i && current_user.member!
           current_user.wikis.update_all(private: false)
        flash[:success] = "You have been downgraded!"
      else
        flash[:alert] = "There was an error downgrading. Please try again"
      end
      redirect_to edit_user_registration_path(current_user)
    end
    
end
