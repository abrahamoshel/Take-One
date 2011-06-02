class Shift < ActiveRecord::Base
  validates :firstName, :lastName, :email, :presence => true 
  validates_format_of :email, :with => /apple\.com/, :message => "You must use your Apple Email"
  validates_format_of :takingEmail, :with => /apple\.com/, :allow_blank => true,  :message => "You must use your Apple Email"

<<<<<<< HEAD
=======
  #def validate
>>>>>>> 6882626e30f05d3b7b8a19225bffcac49b842e11
  #  errors.add_to_base "For Taker\'s Email You must use your Apple Email" if !takingemail.blank?
  #  errors.add_to_base "For Giver\'s Email You must use your Apple Email" if !email.blank?
  #end
    
end
