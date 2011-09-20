class Valuefield < ActiveRecord::Base
  belongs_to :property
  belongs_to :component
  belongs_to :product
end
