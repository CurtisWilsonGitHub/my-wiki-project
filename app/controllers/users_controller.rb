class UsersController < ApplicationController

    def downgrade
        if current_user.id == params[:user_id].to_i
            current_user.member!
            redirect_to edit_user_registration_path(current_user)
        end
        # TODO add error alert
    end
end
