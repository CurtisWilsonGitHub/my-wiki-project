class UpgradesController < ApplicationController

    def downgrade 
        current_user.role = "member"
        current_user.save
        redirect_to edit_user_registration_path(current_user)
    end

    def upgrade 
        current_user.role = "premium"
        current_user.save
        redirect_to edit_user_registration_path(current_user)
    end

end


#should I use a controller? Would a module be better? ask mentor