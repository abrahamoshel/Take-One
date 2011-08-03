class Request < ActiveRecord::Base
  has_many :hours, :dependent => :destroy
  accepts_nested_attributes_for :hours, :allow_destroy => true
end
