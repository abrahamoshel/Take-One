class Holiday < ActiveRecord::Base
  validates :firstName, :lastName, :email, :presence => true
  validates :manager_id, :presence => true
  belongs_to :manager
end
