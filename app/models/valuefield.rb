class Valuefield < ActiveRecord::Base
  belongs_to :property
  has_and_belongs_to_many :components
  has_and_belongs_to_many :products
  has_many :images
  has_many :data_files

  validates_presence_of :fieldvalue

    def to_s   #for debug
    return "#{id}:#{fieldvalue}"
  end
end
