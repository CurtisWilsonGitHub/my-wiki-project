class Collaborator < ApplicationRecord
  belongs_to :wiki
  belongs_to :user
  
  def email
    user.email
  end
end
