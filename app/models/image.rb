class Image < ActiveRecord::Base
  belongs_to :product
  belongs_to :component
  belongs_to :valuefield

  has_attached_file :picture,
                    :path => ":rails_root/public/:class/:attachment/:id/:style_:basename.:extension",
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"
end
