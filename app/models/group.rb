class Group < ActiveRecord::Base
  has_many :components

  def to_s   #for debug
    return "#{id}:#{name}"
  end
end
