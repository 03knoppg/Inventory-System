class Valuefield < ActiveRecord::Base
  belongs_to :property
  belongs_to :component
  belongs_to :product
  has_many :images
  has_many :data_files
end
