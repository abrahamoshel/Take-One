class Interest < ActiveRecord::Base
  belongs_to :employee
  belongs_to :workshop

end
