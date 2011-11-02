class Gallery < ActiveRecord::Base
	
  validates_presence_of :title
  validates_presence_of :body
  
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 7.megabytes
  
  #paperclip
  has_attached_file :photo,
     :styles => {
       :thumb  => "175x175#",
       :lightbox  => "625x625>" 
       }

end
