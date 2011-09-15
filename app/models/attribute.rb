class Attribute < ActiveRecord::Base
  has_many :valuefields
  has_and_belongs_to_many :components
  has_and_belongs_to_many :products
end
