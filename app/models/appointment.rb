class Appointment < ActiveRecord::Base
  belongs_to :workshop
  validates :apptime, :presence => true

  def appointment_times  
    apptime.to_s(:time)  
  end
end
