class Component < ActiveRecord::Base
  has_and_belongs_to_many :attributes
  has_and_belongs_to_many :products
end
