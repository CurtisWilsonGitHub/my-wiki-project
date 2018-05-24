class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis
  has_many :collaborators
  #joins users to wiki through collaborators (join table)
  has_many :wiki_collabs, source: :wiki, through: :collaborators



  before_save { self.email = email.downcase }
  before_save { self.role ||= :member }


  enum role: [ :member, :admin, :premium ]

  def member!
    super
    wikis.update_all(private: false)
  end
end
