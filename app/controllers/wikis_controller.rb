## Wiki Schema information
# create_table "wikis", force: :cascade do |t|
#   t.string "title"
#   t.text "body"
#   t.boolean "private"
#   t.integer "user_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["user_id"], name: "index_wikis_on_user_id"

class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki was saved"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the post"
      redirect_to :show
    end
  end

  def update
    @wiki = Wiki.find(params[:id])

    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was updated"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  private
  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end
end



