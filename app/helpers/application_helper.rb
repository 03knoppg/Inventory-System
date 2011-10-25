module ApplicationHelper

  #Function for displaying customer message - used for deleting parents that contain children
  def confirmation_message(value, value_hash)
      if(value_hash[value.id] == nil)
        return 'Are you sure?'
      else
        return 'This node has children. If you delete this node the children will also be deleted. Are you sure?'
      end
  end


  #creates a button and form with a hidden field in order to pass ids across to new objects
  def my_button_to(text, path, objs)
    s = "<form method=\"get\" action=\"#{path}\"  class=\"button_to\">
          <div><input type=\"submit\" value=\"#{text}\"/></div>"
    for obj in objs
      if(!obj.nil?)
        s+= "<input type=\"hidden\" name=\"#{obj.class.to_s.downcase}_id\" value=\"#{obj.id}\" />"
      end
    end

    s+= "</form>"

    return s.html_safe
  end
    
  #Recursive function for display components - finds parents and then children and organizes them in this way to display
  def components_select_table(cp, depth)

    pt= "<option value=\"#{cp.id}\""
    pt+= " selected=\"true\"" if @component == cp
    pt+= ">#{"-"*depth}"
    pt+= "#{cp.name}"
    pt+= "</option>\n"

    for child in cp.components
      if(child != @component)
        pt += components_select_table(child, depth+1)
      end
    end

    return pt
  end

end
