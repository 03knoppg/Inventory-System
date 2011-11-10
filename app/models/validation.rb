#Validation class
class Validation < ActiveRecord::Base
  validates_presence_of :extension, :kind
end
