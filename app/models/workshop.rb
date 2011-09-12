class Workshop < ActiveRecord::Base
  has_many :registrations
  has_many :employees, :through => :registrations
  
end
