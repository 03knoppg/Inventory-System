class Valuefield < ActiveRecord::Base
  belongs_to :property
  has_and_belongs_to_many :component
  has_and_belongs_to_many :product
  has_many :images
  has_many :data_files
end
