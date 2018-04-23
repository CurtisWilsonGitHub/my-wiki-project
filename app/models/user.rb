class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable, 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis


  before_save { self.email = email.downcase }
  before_save { self.role ||= :member }


  enum role: [ :member, :admin ]
end
