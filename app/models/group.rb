#Group class
class Group < ActiveRecord::Base
  has_many :components
  after_save :set_update

  def to_s   #for debug
    return "#{id}:#{name}"
  end

  def set_update
    update = Updaterecord.find_or_create_by_table_name_and_entry_id(self.class.name.tableize,id)
    update.time = updated_at
    update.save!
  end
end
