class Workshop < ActiveRecord::Base
  has_many :interests
  has_many :employees, :through => :interests
  belongs_to :manager
  has_attached_file :albumcover,
    :styles => { :medium => ["300x300>", :png],  :thumb => ["150x150>", :png]},
    :convert_options => {:medium => Proc.new{self.convert_options}, :thumb => Proc.new{self.convert_options}},
    :url => "/assets/albumcovers/:id/:style/:basename.:extension",  
    :path => ":rails_root/public/assets/albumcovers/:id/:style/:basename.:extension"


  def self.convert_options
    trans = ""
    px = 20
    trans << " \\( +clone  -threshold -1 "
    trans << "-draw 'fill black polygon 0,0 0,#{px} #{px},0 fill white circle #{px},#{px} #{px},0' "
    trans << "\\( +clone -flip \\) -compose Multiply -composite "
    trans << "\\( +clone -flop \\) -compose Multiply -composite "
    trans << "\\) +matte -compose CopyOpacity -composite "
  end
    
end
