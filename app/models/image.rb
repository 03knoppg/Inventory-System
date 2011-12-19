#Class used to validate images - class was placed here due to paperclip bugs
class ImageValidator < ActiveModel::Validator
  #Function used to validate images
  def validate(record)
    #if statement used for seed file due to paperclip way of seeding
    if(record.picture_file_name == nil)
      return true
    end
    validations = Validation.all
    valid = []
    #if statement to check if array is not empty
    if(!validations.empty?)
      #Loop to control what validations go into the valid array for images
      for val in validations
        if(val.kind == "Image")
          valid.push(val.extension)
        end
      end
    end
    #if statement to check if array is not empty
    if(!valid.empty?)
      #checks the array for a substring of the extension on the image and assigns a boolean value
      answer = valid.include?(record.picture_file_name[-4..-1])
      #if answer is false assigns extension values to a string to show an error message to the user
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

#Image class
class Image < ActiveRecord::Base
  has_and_belongs_to_many :products
  has_and_belongs_to_many :components
  has_and_belongs_to_many :valuefields
  after_save :set_update

  #holds the picture information and any sizes defined
  has_attached_file :picture, :styles => { :small => "150x150>" , :medium => "300x300>", :large => "600x600>"},
                    :path => ":rails_root/public/:class/:id/:style/:style_:basename.:extension",
                    :url => "/:class/:id/:style/:style_:basename.:extension"


  #validations for the picture
  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes,  :message => 'must be less than 5 MegaBytes'
  #Custom image extension validator
  validates_with ImageValidator

  def set_update
    update = Updaterecord.find_or_create_by_table_name_and_entry_id(self.class.name.tableize,id)
    update.time = updated_at
    update.save!
  end

  def name
    return picture_file_name
  end
end



