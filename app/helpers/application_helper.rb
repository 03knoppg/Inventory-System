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

  def checkbox_accord(items_hash, show_properties=false, depth=0)

    if(depth == 0 && items_hash.keys.empty?)
      return "No Items Available"
    end

    if(@items_to_select.nil?)
      @items_to_select = []
    end

    if(items_hash.keys.empty?)
      return ""
    end

    pt = "<ul "
    if(depth == 0)
      @counter.nil?? @counter = 1 : @counter += 1
      pt += "id=\"#{@counter}\" class=\"accordion\""
    end

    pt+=">"

    expand = true
    for item in items_hash.keys
      pt += "<li"
      if(depth == 0 && expand && (!item.is_a?(Property) || !item.valuefields.empty?))
        pt += " class=\"expand\""
        expand = false
      end
       pt +=">"

      if(item.is_a?(Category))         #not currently used
        pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "parent_ids[]", item.id, @items_to_select.include?(item), :id=>"a#{item.id}"}"     +  "<label for=\"a#{item.id}\">#{item.name}</label>"
      elsif(item.is_a?(Product))
        pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "product_ids[]", item.id, @items_to_select.include?(item), :id=>"p#{item.id}"}"  +  "<label for=\"p#{item.id}\">#{item.name}</label>"
      elsif(item.is_a?(Component))
        pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "component_parent_ids[]", item.id, @items_to_select.include?(item), :id=>"c#{item.id}"}"  +  "<label for=\"c#{item.id}\">#{item.name}</label>"
      elsif(item.is_a?(Valuefield))
        pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "valuefield_ids[]", item.id, @items_to_select.include?(item), :id=>"v#{item.id}"}"   +  "<label for=\"v#{item.id}\">#{item.fieldvalue}</label>"
      elsif(item.is_a?(Group))         #not currently used
        pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "group_ids[]", item.id, @items_to_select.include?(item), :id=>"g#{item.id}"}"  +  "<label for=\"g#{item.id}\">#{item.name}</label>"
      elsif(item.is_a?(Property))
        if(show_properties)
          pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "#{parent}[property_id]", item.id, @items_to_select.include?(item), :id=>"o#{item.id}"}"   +  "<label for=\"o#{item.id}\">#{item.name}</label>"
        elsif(!item.valuefields.empty?)
          pt += "<div class=\"inline\">&nbsp</div><b>#{item.name}</b>"
        end

      end

      pt += checkbox_accord(items_hash[item], show_properties, depth+1)
      pt += "</li>"

    end

    pt += "</ul>"

    return pt

  end



  #Radio button accordion
  def radio_accord(items_hash, parent, show_properties = false, depth=0)

    if(@items_to_select.nil?)
      @items_to_select = []
    end

    if(items_hash.keys.empty?)
      return ""
    end

    pt = "<ul style=\"list-style-type: none\" "
    if(depth == 0)
      @counter.nil?? @counter = 1 : @counter += 1
      pt += "id=\"#{@counter}\" class=\"\" "
    end

    pt+=">"

    expand = true
    for item in items_hash.keys
      pt += "<li"
      if(depth == 0 && expand && (!item.is_a?(Property) || !item.valuefields.empty?))
        pt += " class=\"expand\""
        expand = false
      end
       pt +="><div class=\"inline\">&nbsp</div>"

      if(item.is_a?(Category))         #not currently used
        pt += "#{radio_button_tag "parent_ids[]", item.id, @items_to_select.include?(item), :id=>"a#{item.id}"}"     +  "<label for=\"a#{item.id}\">#{item.name}</label>"
      elsif(item.is_a?(Product))
        pt += "#{radio_button_tag "product_ids[]", item.id, @items_to_select.include?(item), :id=>"p#{item.id}"}"  +  "<label for=\"p#{item.id}\">#{item.name}</label>"
        #{item.name}</label>"
      elsif(item.is_a?(Component))
        pt += "#{radio_button_tag "component_parent_ids[]", item.id, @items_to_select.include?(item), :id=>"c#{item.id}"}"  +  "<label for=\"c#{item.id}\">#{item.name}</label>"
      elsif(item.is_a?(Valuefield))
        pt += "#{radio_button_tag "valuefield_ids[]", item.id, @items_to_select.include?(item), :id=>"v#{item.id}"}"   +  "<label for=\"v#{item.id}\">#{item.fieldvalue}</label>"
      elsif(item.is_a?(Group))         #not currently used
        pt += "#{radio_button_tag "group_ids[]", item.id, @items_to_select.include?(item), :id=>"g#{item.id}"}"  +  "<label for=\"g#{item.id}\">#{item.name}</label>"
      elsif(item.is_a?(Property))
        if(show_properties)
          pt += "#{radio_button_tag "#{parent}[property_id]", item.id, @items_to_select.include?(item), :id=>"o#{item.id}"}"   +  "<label for=\"o#{item.id}\">#{item.name}</label>"
        elsif(!item.valuefields.empty?)
          pt += "<b>#{item.name}</b>"
        end

      end

      pt += radio_accord(items_hash[item], parent, depth+1)
      pt += "</li>"

    end

    pt += "</ul>"

    return pt

  end


  def all_prod_comp_hash(item=nil)

     hash = {}

     if(!item.nil?)
       items = item.components
     else
       items = Product.all
     end

     for comp in items

       hash[comp] = all_prod_comp_hash(comp)

     end

     return hash

  end



  def all_prop_vf_hash

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

  def all_prop_hash

     hash = {}
     items = Property.all

     for prop in items

       hash[prop] = {}

     end

     return hash

  end

  def all_category_hash(item=nil)

     hash = {}
     items = []

     if(!item.nil?)
        for cat in @all_categories
          if(cat.parent_id.eql?(item.id))
            items.push(cat)
          end
        end
     else
       for cat in @all_categories
          if(cat.parent_id.nil?)
            items.push(cat)
          end
        end
     end

     for cat in items

       hash[cat] = all_category_hash(cat)

     end

     return hash

   end

  def all_group_hash
    hash = {}
    for group in Group.all
      hash[group] = {}
    end
    return hash
  end



end
