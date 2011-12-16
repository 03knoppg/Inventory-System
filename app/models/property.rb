#Property class
class Property < ActiveRecord::Base
  has_many :valuefields
  has_and_belongs_to_many :products
  has_and_belongs_to_many :components
  after_save :set_update

  #Validations
  validates_presence_of :name, :description, :field_type

  def valuefields

    return Valuefield.find_all_by_property_id(id)

  end

  def to_s   #for debug
    return "#{id}:#{name}"
  end

  def set_update
    update = Updaterecord.find_or_create_by_table_name_and_entry_id(self.class.name.tableize,id)
    update.time = updated_at
    update.save!
  end
end
