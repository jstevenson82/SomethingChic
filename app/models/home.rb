class Home < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :body
  
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  #paperclip
  has_attached_file :photo, :styles => { :home  => "820x360#" }
end
