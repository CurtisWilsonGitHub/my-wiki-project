class UsersController < ApplicationController

    def downgrade
        if current_user.id == params[:user_id].to_i
            current_user.member!
            redirect_to edit_user_registration_path(current_user)
        else
          flash[:alert] = "There was an error downgrading. Please try again"
        end
    end
end
