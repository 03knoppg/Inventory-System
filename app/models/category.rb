#Category class
class Category < ActiveRecord::Base
  has_and_belongs_to_many :products

  #validations
  validates_presence_of :name

  def to_s   #for debug
    return "#{id}:#{name}"
  end

end
