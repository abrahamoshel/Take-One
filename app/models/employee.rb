class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :registerable, :confirmable
  
  has_many :interests
  has_many :workshops, :through => :interests
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :userName, :firstName, :lastName, :workshop_ids, :appselect, :homeEmail


  validates_format_of :email, :with => /^!?\S.+apple.com$/, :message => "You must use your Apple Email"

end
