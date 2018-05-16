


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
  end



  private

  def collaborator_params
    params.require(:collaborator).permit(:user_id, :wiki_id)
  end

end
