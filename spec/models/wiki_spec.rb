## schema info
# 
#   table :wikis 
#   t.string :title
#   t.text :body
#   t.boolean :private
#   t.references :user, foreign_key: true
#   t.timestamps

require 'rails_helper'

RSpec.describe Wiki, type: :model do
  
  context "attributes tests" do
    
    it 'has a title, body, and user' do
      user = create(:user)
      wiki = create(:wiki)
      wiki.user = user
      expect(wiki).to have_attributes(title: wiki.title, body: wiki.body, user: user)
    end

  end
end
