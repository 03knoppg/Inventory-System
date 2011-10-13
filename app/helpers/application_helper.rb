module ApplicationHelper

  #Function for displaying customer message - used for deleting parents that contain children
  def confirmation_message(value, value_hash)
      if(value_hash[value.id] == nil)
        return 'Are you sure?'
      else
        return 'This node has children. If you delete this node the children will also be deleted. Are you sure?'
      end
  end
end
