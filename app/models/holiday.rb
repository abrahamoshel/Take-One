class Holiday < ActiveRecord::Base
  validates :firstName, :lastName, :email, :firstStart, :firstEnd, :presence => true
  validates :manager_id, :presence => true

  validates_format_of :email, :with => /apple\.com/, :message => "You must use your Apple Email"

  belongs_to :manager
end
