class Workshop < ActiveRecord::Base
  has_many :interests
  has_many :employees, :through => :interests
  belongs_to :manager
  
end
