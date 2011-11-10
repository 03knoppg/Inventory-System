#Property class
class Property < ActiveRecord::Base
  has_many :valuefields
  has_and_belongs_to_many :products
  has_and_belongs_to_many :components

  #Validations
  validates_presence_of :name, :description, :field_type

  def to_s   #for debug
    return "#{id}:#{name}"
  end
end
