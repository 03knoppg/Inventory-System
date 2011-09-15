class Valuefield < ActiveRecord::Base
  has_and_belongs_to_many :products
  has_and_belongs_to_many :components
  belongs_to :attribute
end
