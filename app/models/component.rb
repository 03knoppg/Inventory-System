class Component < ActiveRecord::Base
  has_and_belongs_to_many :properties
  has_and_belongs_to_many :products
  has_many :valuefields
  belongs_to :group


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

  has_attached_file :photo,
                    :styles => {
                    :thumb=> "100x100#",
                    :small  => "150x150>" }
end
