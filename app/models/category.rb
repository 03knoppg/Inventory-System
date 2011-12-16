#Category class
class Category < ActiveRecord::Base
  has_and_belongs_to_many :products
  after_save :set_update

  #validations
  validates_presence_of :name

  def categories
    children = []

    for cat in Category.all
      if cat.parent_id == id
        children.push(cat)
      end
    end

    return children
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
