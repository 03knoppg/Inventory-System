#Category class
class Category < ActiveRecord::Base
  has_and_belongs_to_many :products

  #validations
  validates_presence_of :name

  def categories
    children = []

    for cat in Category.all
      if cat.parent_id == id
        children.push(cat)
      end
    end

    return children
  end

  def to_s   #for debug
    return "#{id}:#{name}"
  end

end
