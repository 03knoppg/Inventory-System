#Product class
class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :components
  has_and_belongs_to_many :properties
  has_and_belongs_to_many :valuefields
  has_and_belongs_to_many :images
  has_and_belongs_to_many :data_files
  after_save :set_update

  #Validations
  validates_presence_of :name, :description

  def to_s   #for debug
    return "#{id}:#{name}"
  end

  def set_update
    update = Updaterecord.find_or_create_by_table_name_and_entry_id(self.class.name.tableize,id)
    update.time = updated_at
    update.save!
  end
end
