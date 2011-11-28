#Component class
class Component < ActiveRecord::Base
  has_and_belongs_to_many :properties
  has_and_belongs_to_many :products
  has_and_belongs_to_many :valuefields
  belongs_to :group
  has_and_belongs_to_many :images
  has_and_belongs_to_many :data_files
  after_save :set_update


  #Self referencing information
  has_and_belongs_to_many :components,
                          #:join_table => 'components_components',
                          :foreign_key => 'component_parent_id',
                          :association_foreign_key => 'component_child_id',
                          :class_name => 'Component'

  has_and_belongs_to_many :component_parents,
                          #:join_table => 'components_components',
                          :foreign_key => 'component_child_id',
                          :association_foreign_key => 'component_parent_id',
                          :class_name => 'Component'

  def to_s   #for debug
    return "#{id}:#{name}"
  end

  def set_update
    update = Updaterecord.find_or_create_by_table_name_and_entry_id(self.class.name.tableize,id)
    update.time = updated_at
    update.save!
  end
end
