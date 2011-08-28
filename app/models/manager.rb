class Manager < ActiveRecord::Base
  has_many :holidays, :dependent => :destroy
  #accepts_nested_attributes_for :holidays, :allow_dstroy => true
end
