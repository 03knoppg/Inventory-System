class Attribute < ActiveRecord::Base
  has_many :value_fields
  has_and_belongs_to_many :components
  has_and_belongs_to_many :products
end
