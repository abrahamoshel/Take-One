class Interest < ActiveRecord::Base
  belongs_to :employee
  belongs_to :workshop
  validates :appselect, :presence => true, :if => "!workshop.appointments.blank?"

  def selected_time
    appselect.to_s(:time)
  end

  def full_name 
    "#{employee.firstName} #{employee.lastName}"
  end
  
end
