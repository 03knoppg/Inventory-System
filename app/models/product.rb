class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :components
  has_and_belongs_to_many :properties
  has_and_belongs_to_many :valuefields
  has_many :images
  has_many :data_files

  validates_presence_of :name, :description

  def to_s   #for debug
    return "#{id}:#{name}"
  end
end
