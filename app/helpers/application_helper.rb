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

  def banner
    @images = Image.all
    if(!@images.empty?)
    for img in @images
      if(img.picture_file_name == "3di_media_server.png")
        @imagelogo = img.picture.url
      end
      if(img.picture_file_name == "banner.png")
        @imagebanner = img.picture.url
      end
    end
  end
  end


    #Recursive function for display components - finds parents and then children and organizes them in this way to display

  def parent_accord(items_hash, id, depth)
    if(items_hash.keys.empty?)
      return ""
    end

    pt = "<ul"
    if(depth == 0)
      pt += " id=\"acc#{id}\" class=\"accordion\""
    end

    pt+=">"

    for item in items_hash.keys
      pt += "<li>"
      if(item.is_a?(Product))
        pt += "#{check_box_tag 'product_ids[]', item.id}"   + "#{item.name}"
      elsif(item.is_a?(Component))
        pt += "#{check_box_tag 'component_parent_ids[]', item.id}"  + "#{item.name}"
      elsif(item.is_a?(Valuefield))
        pt += "#{check_box_tag 'valuefield_ids[]', item.id}"   + "#{item.fieldvalue}"
      elsif(item.is_a?(Group))
        pt += "#{radio_button_tag 'group_id', item.id}"   + "#{item.name}"
      elsif(item.is_a?(Property))
        pt += "#{item.name}"
      end

      pt += parent_accord(items_hash[item], id, depth+1)
      pt += "</li>"

    end

    pt += "</ul>"

    return pt

  end

  def prod_comp_hash(item)

     hash = {}

     if(!item.nil?)
       items = item.components
     else
       items = Product.all
     end

     for comp in items

       hash[comp] = prod_comp_hash(comp)

     end

     return hash

   end

  def prop_vf_hash

     hash = {}
     items = Property.all

     for prop in items

       hash[prop] = {}
       for vf in prop.valuefields

         hash[prop][vf] = {}

       end
     end

     return hash

   end

  def group_hash
    hash = {}
    for group in Group.all
      hash[group] = {}
    end
    return hash
  end


end
