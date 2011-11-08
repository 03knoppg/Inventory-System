#Class used to validate data files
class DataFileValidator < ActiveModel::Validator
  #Function used to validate data files
  def validate(record)
    #if statement used for seed file due to paperclip way of seeding
    if(record.filedata_file_name == nil)
      return true
    end
    validations = Validation.all
    valid = []
    if(!validations.empty?)
      for val in validations
        if(val.kind == "Data File")
          valid.push(val.extension)
        end
      end
    end
    if(!valid.empty?)
      answer = valid.include?("." + record.filedata_file_name.split(".").last)
      if(answer == false)
        s = ""
        for v in valid
          s+= v + " "
        end
        record.errors[:base] << "Invalid Data File Extension. Accepted extensions are: " + s
      end
    end
    end
end

class DataFile < ActiveRecord::Base
  has_and_belongs_to_many :products
  has_and_belongs_to_many :components
  has_and_belongs_to_many :valuefields

  has_attached_file :filedata,
                    :path => ":rails_root/public/:class/:id/:basename.:extension",
                    :url => "/:class/:id/:basename.:extension"

   validates_attachment_presence :filedata
   validates_attachment_size :filedata, :less_than => 5.megabytes,  :message => 'must be less than 5 MegaBytes'
   #Custom data file extension validator
   validates_with DataFileValidator
end
