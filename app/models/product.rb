class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :attributes
  has_and_belongs_to_many :components
  has_many :value_fields
end
