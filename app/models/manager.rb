class Manager < ActiveRecord::Base
  has_many :holidays, :dependent => :destroy
end
