class Property < ActiveRecord::Base
  has_many :valuefields
  has_and_belongs_to_many :products
  has_and_belongs_to_many :components
end
