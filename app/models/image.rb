class Image < ActiveRecord::Base
  belongs_to :product
  belongs_to :component
  belongs_to :valuefield

  has_attached_file :picture, :styles => { :small => "150x150>" , :medium => "300x300>", :large => "600x600>"},
                    :path => ":rails_root/public/:class/:attachment/:id/:style/:style_:basename.:extension",
                    :url => "/:class/:attachment/:id/:style/:style_:basename.:extension"

   validates_attachment_presence :picture
   validates_attachment_size :picture, :less_than => 5.megabytes,  :message => 'filesize must be less than 5 MegaBytes'
   validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/bmp', 'image/gif']
end
