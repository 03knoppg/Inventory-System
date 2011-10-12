class DataFile < ActiveRecord::Base
  belongs_to :product
  belongs_to :component
  belongs_to :valuefield

  has_attached_file :filedata,
                    :path => ":rails_root/public/:class/:attachment/:basename/:basename.:extension",
                    :url => "/:class/:attachment/:basename/:basename.:extension"

   validates_attachment_presence :filedata
   validates_attachment_size :filedata, :less_than => 5.megabytes,  :message => 'filesize must be less than 5 MegaBytes'
   #validates_attachment_content_type :filedata, :content_type =>
end
