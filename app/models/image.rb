class Image < ActiveRecord::Base
  belongs_to :product
  belongs_to :component
  belongs_to :valuefield

  #after_update :delete_pics

  has_attached_file :picture, :styles => { :small => "150x150>" , :medium => "300x300>", :large => "600x600>"},
                    :path => ":rails_root/public/:class/:attachment/:basename/:style/:style_:basename.:extension",
                    :url => "/:class/:attachment/:basename/:style/:style_:basename.:extension"

   validates_attachment_presence :picture
   validates_attachment_size :picture, :less_than => 5.megabytes,  :message => 'filesize must be less than 5 MegaBytes'
   validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/bmp', 'image/gif']

  def delete_pics
    logger.info("**********************************************START delete_pics.")
    build_path = "#{Rails.root}/public/images/pictures/1/"
    pic_array = []

    ["small", "medium", "large", "original"].each do |s|

      Dir.glob(build_path + "#{s}/*").each do |i|
        next if i == "#{s}_C40.png"
        pic_array << i
      end
    end

    logger.info("**********************************************YAH, I DID THIS. #{pic_array.join("\n")}")
    pic_array.each {|pa| File.delete(pa)}
  end

end
