class Request < ActiveRecord::Base
  has_many :hours, :dependent => :destroy
  accepts_nested_attributes_for :hours, :allow_destroy => true
  validates_format_of :email, :with => /apple\.com/, :message => "You must use your Apple Email"
  validates :firstName, :lastName, :email, :startDate, :endDate, :presence => true 
end
