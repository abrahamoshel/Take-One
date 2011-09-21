class Workshop < ActiveRecord::Base
  has_many :interests
  has_many :employees, :through => :interests
  has_many :appointments
  accepts_nested_attributes_for :appointments, :allow_destroy => true
  validates :manager, :description, :startDate, :endDate, :name, :presence => true
  

  belongs_to :manager
  has_attached_file :albumcover,
    :styles => { :medium => ["300x300>", :png],  :thumb => ["150x150>", :png]},
    :convert_options => {:medium => Proc.new{self.convert_options}, :thumb => Proc.new{self.convert_options}},
    :url => "/assets/albumcovers/:id/:style/:basename.:extension",  
    :path => "#{Rails.public_path}/assets/albumcovers/:id/:style/:basename.:extension",
    :storage => :s3,
    :bucket => 'retailapp',
    :s3_credentials => {
      :access_key_id => S3_KEY,
      :secret_access_key => S3_SECRET
    }
  
  validates_attachment_presence :albumcover  
  validates_attachment_size :albumcover, :less_than => 2.megabytes  
  validates_attachment_content_type :albumcover, :content_type => ['image/jpeg', 'image/png', 'image/gif']  
  
  def manager_full_name
    "#{manager.firstName} #{manager.lastName}"
  end
  def self.convert_options
    trans = ""
    px = 20
    trans << " \\( +clone  -threshold -1 "
    trans << "-draw 'fill black polygon 0,0 0,#{px} #{px},0 fill white circle #{px},#{px} #{px},0' "
    trans << "\\( +clone -flip \\) -compose Multiply -composite "
    trans << "\\( +clone -flop \\) -compose Multiply -composite "
    trans << "\\) +matte -compose CopyOpacity -composite "
  end

  # method that get alled in Interest to delete match apptiem and appslecet so people don't book multipule appointments
  def available_times
    interests = self.interests
    appointments = self.appointments

    interests_by_appointments = {}
    # loop through each interest
    interests.each do |interest|
      #loop through appointments
      appointments.each do |appointment|
        # get the array or take a blank array
        interests_by_appointments[interest.appselect] ||= []
        # push into the arrary if apptime and appslect is equal
        interests_by_appointments[interest.appselect] << appointment if appointment.apptime == interest.appselect
      end
    end

    return interests_by_appointments
  end

  # { appoint => [interest1, interest2], appointment2 => [interest4] }
    
end
