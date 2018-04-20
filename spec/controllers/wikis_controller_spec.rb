## Wiki Schema information
# create_table "wikis", force: :cascade do |t|
#   t.string "title"
#   t.text "body"
#   t.boolean "private"
#   t.integer "user_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["user_id"], name: "index_wikis_on_user_id"

require 'rails_helper'

RSpec.describe WikisController, type: :controller do

  let(:test_wiki) { create(:wiki) }
  let(:test_user) { create(:user) }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns Wikis.all to wiki" do
      get :index
      expect(assigns(:wikis)).to eq(Wiki.all)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @wiki" do
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end

  end

  describe "POST create" do
    before do
      sign_in test_user
    end

    it "increases the number of wikis by 1" do
      
      expect{ post :create, params: {wiki: { title: "A new title", body: "A new wiki body"} } }.to change(Wiki,:count).by(1)
    end

    it "assigns the new post to @post" do
      post :create, params: { wiki: {title: "A new title", body: "A new wiki body"} }
      expect(assigns(:wiki)).to eq Wiki.last
    end

    it "redirects to the new post" do
      post :create, params: { wiki: {title: "A new title", body: "A new wiki body"} }
      expect(response).to redirect_to Wiki.last
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: { id: test_wiki.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: test_wiki.id }
      expect(response).to render_template :show
   end

    it "assigns test_wiki to @wiki" do
      get :show, params: { id: test_wiki.id }
      expect(assigns(:wiki)).to eq(test_wiki)
    end
  end
  
  describe "PUT update" do
    it "updates wiki with expected attributes" do
      new_title = Faker::Lorem.sentence
      new_body = Faker::Lorem.paragraph

      put :update, params: { id: test_wiki.id, wiki: {title: new_title, body: new_body}}
      updated_wiki = assigns(:wiki)
      expect(updated_wiki.id).to eq test_wiki.id
      expect(updated_wiki.title).to eq new_title
      expect(updated_wiki.body).to eq new_body
    end

    it "redirects to the updated wiki" do
      new_title = Faker::Lorem.sentence
      new_body = Faker::Lorem.paragraph

      put :update, params: { id: test_wiki.id, wiki: {title: new_title, body: new_body}}
      expect(response).to redirect_to [test_wiki]
    end
  end

  describe "DELETE destroy" do
    it "deletes the wiki" do
      delete :destroy, params: {id: test_wiki.id}
      count = Wiki.where({id:test_wiki.id}).size
      expect(count).to eq(0)
    end

    it "redirects to wiki show" do
      delete :destroy, params: {id: test_wiki.id}
      expect(response).to redirect_to wikis_path
    end
  end
end
