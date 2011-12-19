#Class used to validate data files - placed here due to paperclip bugs
class DataFileValidator < ActiveModel::Validator
  #Function used to validate data files
  def validate(record)
    #if statement used for seed file due to paperclip way of seeding
    if(record.filedata_file_name == nil)
      return true
    end
    validations = Validation.all
    valid = []
    #if statement to check if array is not empty
    if(!validations.empty?)
      #Loop to assign validation extensions for Data Files
      for val in validations
        if(val.kind == "Data File")
          valid.push(val.extension)
        end
      end
    end
    #if statement to check if array is not empty
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

#Data File class
class DataFile < ActiveRecord::Base
  has_and_belongs_to_many :products
  has_and_belongs_to_many :components
  has_and_belongs_to_many :valuefields
  after_save :set_update

  has_attached_file :filedata,
                    :path => ":rails_root/public/:class/:id/:basename.:extension",
                    :url => "/:class/:id/:basename.:extension"

  #Validations
   validates_attachment_presence :filedata
   validates_attachment_size :filedata, :less_than => 5.megabytes,  :message => 'must be less than 5 MegaBytes'
   #Custom data file extension validator
   validates_with DataFileValidator

  def set_update
    update = Updaterecord.find_or_create_by_table_name_and_entry_id(self.class.name.tableize,id)
    update.time = updated_at
    update.save!
  end

  def name
    return filedata_file_name
  end
end
