#Validation class
class Validation < ActiveRecord::Base
  validates_presence_of :extension, :kind
  after_save :set_update

  def set_update
    update = Updaterecord.find_or_create_by_table_name_and_entry_id(self.class.name.tableize,id)
    update.time = updated_at
    update.save!
  end

  def name
    return extension
  end
end
