#Value Field class
class Valuefield < ActiveRecord::Base
  belongs_to :property
  has_and_belongs_to_many :components
  has_and_belongs_to_many :products
  has_and_belongs_to_many :images
  has_and_belongs_to_many :data_files
  after_save :set_update

  #Validations
  validates_presence_of :fieldvalue

    def to_s   #for debug
    return "#{id}:#{fieldvalue}"
    end

  def name
    return fieldvalue
  end

  def set_update
    update = Updaterecord.find_or_create_by_table_name_and_entry_id(self.class.name.tableize,id)
    update.time = updated_at
    update.save!
  end
end
