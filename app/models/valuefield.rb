class Valuefield < ActiveRecord::Base
  belongs_to :attribute
  belongs_to :component
  belongs_to :product
end
