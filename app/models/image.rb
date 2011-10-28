#Class used to validate images
class ImageValidator < ActiveModel::Validator
  #Function used to validate images
  def validate(record)
    #if statement used for seed file due to paperclip way of seeding
    if(record.picture_file_name == nil)
      return true
    end
    validations = Validation.all
    valid = []
    if(!validations.empty?)
      for val in validations
        if(val.kind == "Image")
          valid.push(val.extension)
        end
      end
    end
    if(!valid.empty?)
      answer = valid.include?(record.picture_file_name[-4..-1])
      if(answer == false)
        s = ""
        for v in valid
          s+= v + " "
        end
        record.errors[:base] << "Invalid Image Extension. Accepted extensions are: " + s
      end
    end
    end
end

class Image < ActiveRecord::Base
  has_and_belongs_to_many :products
  has_and_belongs_to_many :components
  has_and_belongs_to_many :valuefields

  has_attached_file :picture, :styles => { :small => "150x150>" , :medium => "300x300>", :large => "600x600>"},
                    :path => ":rails_root/public/:class/:id/:style/:style_:basename.:extension",
                    :url => "/:class/:id/:style/:style_:basename.:extension"

  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes,  :message => 'must be less than 5 MegaBytes'
  #Custom image extension validator
  validates_with ImageValidator

end



