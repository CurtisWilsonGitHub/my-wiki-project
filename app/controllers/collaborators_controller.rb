


class CollaboratorsController < ApplicationController

  def new
    @collaborator = Collaborator.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.build(collaborator_params)

    if @collaborator.save
      flash[:notice] = "Collaborator added!"
    else
      flash[:aler] = "Collaborator was not saved. Please try again"
    end
    redirect_to :back
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.find(params[:collaborator][:id])


    if @collaborator.destroy
      flash[:notice] = "\"#{@collaborator.email}\" was removed successfully."
      redirect_to session.delete(:return_to)
    else
      flash.now[:alert] = "There was an error removing the user"
      redirect_to :back
    end
  end



  private

  def collaborator_params
    params.require(:collaborator).permit(:user_id, :wiki_id)
  end

end
