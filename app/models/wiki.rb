class Wiki < ApplicationRecord
  belongs_to :user
  has_many :users, through: :collaborators
  has_many :collaborators


end
