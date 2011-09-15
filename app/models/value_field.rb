class ValueField < ActiveRecord::Base
  belongs_to :product
  belongs_to :attribute
end
