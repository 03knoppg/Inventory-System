module ApplicationHelper

  #Function to assign global variables for table alias names usable by the entire application
   def assign_alias
    for ta in TableAlias.all
        if(ta.tableName.eql?("categories"))
          @category_alias = ta.aliasName
        elsif(ta.tableName.eql?("products"))
          @product_alias = ta.aliasName
        elsif(ta.tableName.eql?("components"))
          @component_alias = ta.aliasName
        elsif(ta.tableName.eql?("data_files"))
          @df_alias = ta.aliasName
        elsif(ta.tableName.eql?("groups"))
          @group_alias = ta.aliasName
        elsif(ta.tableName.eql?("images"))
          @image_alias = ta.aliasName
        elsif(ta.tableName.eql?("properties"))
          @property_alias = ta.aliasName
        elsif(ta.tableName.eql?("valuefields"))
          @vf_alias = ta.aliasName
        elsif(ta.tableName.eql?("validations"))
          @validation_alias = ta.aliasName
        end
    end
   end

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

  #Function to fill banner and logo portion of web pages
  def banner
    if(@all_images.nil?)
      @all_images = Image.all
    end

    if(!@all_images.empty?)
      for img in @all_images
        if(img.picture_file_name == "Company_Logo.png")
          @imagelogo = img.picture.url
        end
        if(img.picture_file_name == "Company_Banner.png")
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
      pt += "id=\"id#{Time.now.usec}\" class=\"accordion\""
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
      #Checks what class the item is
      if(item.is_a?(Category))
        pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "parent_ids[]", item.id, @items_to_select.include?(item), :id=>"a#{item.id}"}"     +  "<label for=\"a#{item.id}\">#{item.name}</label>"
      elsif(item.is_a?(Product))
        pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "product_ids[]", item.id, @items_to_select.include?(item), :id=>"p#{item.id}"}"  +  "<label for=\"p#{item.id}\">#{item.name}</label>"
      elsif(item.is_a?(Component))
        pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "component_parent_ids[]", item.id, @items_to_select.include?(item), :id=>"c#{item.id}"}"  +  "<label for=\"c#{item.id}\">#{item.name}</label>"
      elsif(item.is_a?(Valuefield))
        pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "valuefield_ids[]", item.id, @items_to_select.include?(item), :id=>"v#{item.id}"}"   +  "<label for=\"v#{item.id}\">#{item.name}</label>"
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

  #Recursive function for display components - finds parents and then children and organizes them in this way to display
  #Used to disable parent in list so you cannot remove or add it to itself
  def checkbox_accord2(items_hash, show_properties=false, depth=0)
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
      pt += "id=\"id#{Time.now.usec}\" class=\"accordion\""
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
      #Checks what class the item is
      if(item.is_a?(Category))
        pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "parent_ids[]", item.id, @items_to_select.include?(item), :id=>"a#{item.id}"}"     +  "<label for=\"a#{item.id}\">#{item.name}</label>"
      elsif(item.is_a?(Product))
        pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "product_ids[]", item.id, @items_to_select.include?(item), :id=>"p#{item.id}"}"  +  "<label for=\"p#{item.id}\">#{item.name}</label>"
      elsif(item.is_a?(Component))
        #Checks to see if the current component is the parent so you cannot select it
        if(item.eql?(@parent))
          pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "component_parent_ids[]", item.id, @items_to_select.include?(item), :id=>"c#{item.id}", :disabled => true}"  +  "<label for=\"c#{item.id}\">#{item.name}</label>"
        else
          pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "component_parent_ids[]", item.id, @items_to_select.include?(item), :id=>"c#{item.id}"}"  +  "<label for=\"c#{item.id}\">#{item.name}</label>"
        end
      elsif(item.is_a?(Valuefield))
        pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "valuefield_ids[]", item.id, @items_to_select.include?(item), :id=>"v#{item.id}"}"   +  "<label for=\"v#{item.id}\">#{item.name}</label>"
      elsif(item.is_a?(Group))         #not currently used
        pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "group_ids[]", item.id, @items_to_select.include?(item), :id=>"g#{item.id}"}"  +  "<label for=\"g#{item.id}\">#{item.name}</label>"
      elsif(item.is_a?(Property))
        if(show_properties)
          pt += "<div class=\"inline\">&nbsp</div>#{check_box_tag "#{parent}[property_id]", item.id, @items_to_select.include?(item), :id=>"o#{item.id}"}"   +  "<label for=\"o#{item.id}\">#{item.name}</label>"
        elsif(!item.valuefields.empty?)
          pt += "<div class=\"inline\">&nbsp</div><b>#{item.name}</b>"
        end
      end
      pt += checkbox_accord2(items_hash[item], show_properties, depth+1)
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
      pt += "id=\"id#{Time.now.usec}\""
      if(!items_hash.keys[0].is_a?(Group))
          pt+=' class="accordion"'
      end

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
        pt += "#{radio_button_tag "valuefield_ids[]", item.id, @items_to_select.include?(item), :id=>"v#{item.id}"}"   +  "<label for=\"v#{item.id}\">#{item.name}</label>"
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

  #Function to build a radio button list
  def radio_list(items)
    rl = "<ul>"
    if(!items.empty?)
      for item in items
          if(item.is_a?(Category))         #not currently used
            rl += "#{radio_button_tag "category_ids[]", item.id, @items_to_select.include?(item), :id=>"a#{item.id}"}"     +  "<label for=\"a#{item.id}\">#{item.name}</label><br />"
          elsif(item.is_a?(Product))
            rl += "#{radio_button_tag "product_ids[]", item.id, @items_to_select.include?(item), :id=>"p#{item.id}"}"  +  "<label for=\"p#{item.id}\">#{item.name}</label><br />"
            #{item.name}</label>"
          elsif(item.is_a?(Component))
            rl += "#{radio_button_tag "component_ids[]", item.id, @items_to_select.include?(item), :id=>"c#{item.id}"}"  +  "<label for=\"c#{item.id}\">#{item.name}</label><br />"
          elsif(item.is_a?(Valuefield))
            rl += "#{radio_button_tag "valuefield_ids[]", item.id, @items_to_select.include?(item), :id=>"v#{item.id}"}"   +  "<label for=\"v#{item.id}\">#{item.name}</label><br />"
          elsif(item.is_a?(Group))         #not currently used
            rl += "#{radio_button_tag "group_ids[]", item.id, @items_to_select.include?(item), :id=>"g#{item.id}"}"  +  "<label for=\"g#{item.id}\">#{item.name}</label><br />"
          elsif(item.is_a?(Property))
            rl += "#{radio_button_tag "property_ids[]", item.id, @items_to_select.include?(item), :id=>"o#{item.id}"}"   +  "<label for=\"o#{item.id}\">#{item.name}</label><br />"
        end
      end
      rl += "</ul>"
    end
    return rl
  end

  #Function to build a checkbox list  - only usable for an array of the same class
  def checkbox_list(items)
    cl = "<ul>"
    if(!items.empty?)
      item_class = items[0].class.to_s
      item_class_sub = item_class[0..0].to_s
      for item in items
        cl += "<li>#{check_box_tag(item_class +"_ids[]", item.id, @items_to_select.include?(item), :id=>"#{item_class_sub + "" + item.id.to_s}")}"

        cl += "<label for=\"#{item_class_sub + "" + item.id.to_s}\">#{item.name}</label></li>"

      end
      cl += "</ul>"
    end
      return cl
  end

  #Recursive function for display categories or components - finds parents and then children and organizes them in this way to display
  def main_menu_accord(items_hash, show_properties=false, depth=0)
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
      pt += "id=\"id#{Time.now.usec}\" class=\"accordion\""
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
      if(item.is_a?(Category))
          pt += "<div class=\"inline\">&nbsp&nbsp&nbsp</div><label class=\"label_main_menu\">#{link_to(item.name, item)}</label>"
      elsif(item.is_a?(Component))
        pt += "<div class=\"inline\">&nbsp&nbsp&nbsp</div><label class=\"label_main_menu\">#{link_to(item.name, 'tabs/component/' + item.id.to_s)}</label>"
      end
      pt += main_menu_accord(items_hash[item], show_properties, depth+1)
      pt += "</li>"
    end
    pt += "</ul>"
    return pt
  end

  #Prints a list of links for the Main Menu
  def print_link_list(items)

    linkString = ""
    if(!items.empty?  && items[0].is_a?(Category))
      linkString += "<tr><td>#{link_to "New Category", new_category_url, {:style=>'color:#FF8000'}}</td></tr>"
      linkString += "<tr><td>#{main_menu_accord(all_category_hash)}</td></tr>"
    elsif(!items.empty?  && items[0].is_a?(Component))
      linkString += "<tr><td>#{link_to "New Component", new_component_url, {:style=>'color:#FF8000'}}</td></tr>"
      linkString += "<tr><td>#{main_menu_accord(all_component_hash)}</td></tr>"
    elsif(!items.empty?)
      for item in items
        if(item.is_a?(Product))
          if(item == items[0])
            linkString += "<tr><td>#{link_to "New Product", new_product_url, {:style=>'color:#FF8000'}}</td></tr>"
          end
          linkString += "<tr><td>#{link_to(item.name, 'tabs/product/' + item.id.to_s)}</td></tr>"
        elsif(item.is_a?(Group))
          if(item == items[0])
            linkString += "<tr><td>#{link_to "New Group", new_group_url, {:style=>'color:#FF8000'}}</td></tr>"
          end
          linkString += "<tr><td>#{link_to(item.name, item)}</td></tr>"
        elsif(item.is_a?(Property))
          if(item == items[0])
            linkString += "<tr><td>#{link_to "New Property", new_property_url, {:style=>'color:#FF8000'}}</td></tr>"
          end
          linkString += "<tr><td>#{link_to(item.name, item)}</td></tr>"
        elsif(item.is_a?(DataFile))
          if(item == items[0])
             linkString += "<tr><td>#{link_to "New Data File", new_data_file_url, {:style=>'color:#FF8000'}}</td></tr>"
          end
          linkString += "<tr><td>#{link_to(item.filedata_file_name, item)}</td></tr>"
        elsif(item.is_a?(Image))
          if(item == items[0])
             linkString += "<tr><td>#{link_to "New Image", new_image_url, {:style=>'color:#FF8000'}}</td></tr>"
          end
          linkString += "<tr><td>#{link_to(item.picture_file_name, item)}</td></tr>"
        elsif(item.is_a?(Validation))
          if(item == items[0])
             linkString += "<tr><td>#{link_to "New Validation", new_validation_url, {:style=>'color:#FF8000'}}</td></tr>"
          end
          linkString += "<tr><td>#{link_to(item.extension, item)}</td></tr>"
        elsif(item.is_a?(Valuefield))
          if(item == items[0])
             linkString += "<tr><td>#{link_to "New Value Field", new_valuefield_url, {:style=>'color:#FF8000'}}</td></tr>"
          end
          linkString += "<tr><td>#{link_to(item.name, item)}</td></tr>"
         elsif(item.is_a?(TableAlias))
          if(item == items[0])
             linkString += "<tr><th>Original Name</th>"
             linkString += "<th>Current Name</th></tr>"
          end
          linkString += "<tr><td>#{item.tableName}</td>"
          linkString += "<td>#{link_to(item.aliasName, item)}</td></tr>"
        end
      end
    else
      linkString += "None Available."
    end

    return linkString
  end



   #Creates a hash for all categories
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

  #Creates a hash for all groups
  def all_group_hash
    hash = {}
    for group in @all_groups
      hash[group] = {}
    end
    return hash
  end

  #Creates a hash for all properties
  def all_property_hash
     hash = {}
     items = @all_properties
     for prop in items
       hash[prop] = {}
     end
     return hash
  end

  #Creates a hash for all products
  def all_product_hash
    hash = {}
    items = @all_products
    for prod in items
      hash[prod] = {}
    end
    return hash
  end

  #Creates a hash for all components
  def all_component_hash(item=nil)
    hash = {}
    items = []
    if(!item.nil?)
      items = item.components
    else
      for comp in @all_components
        if(comp.component_parents.empty?)
           items.push(comp)
        end
      end
    end
    for comp in items
      hash[comp] = all_component_hash(comp)
    end
    return hash
  end

  #Creates a hash for all valuefields
  def all_valuefield_hash
    hash = {}
    items = @all_valuefields
    for vf in items
      hash[vf] = {}
    end
    return hash
  end

   #Creates a hash for all images
  def all_image_hash
    hash = {}
    items = @all_images
    for img in items
      hash[img] = {}
    end
    return hash
  end

   #Creates a hash for all images
  def all_datafile_hash
    hash = {}
    items = @all_datafiles
    for df in items
      hash[df] = {}
    end
    return hash
  end

  #Creates a hash for all images
  def all_validation_hash
    hash = {}
    items = @all_validations
    for vd in items
      hash[vd] = {}
    end
    return hash
  end

  #Creates a hash for all products and components
  def all_prod_comp_hash(item=nil)

     hash = {}

     if(!item.nil?)
       items = item.components
     else
       items = @all_products
     end

     for comp in items

       hash[comp] = all_prod_comp_hash(comp)

     end

     return hash

  end



  def all_prop_vf_hash

     hash = {}
     items = @all_properties

     for prop in items

       hash[prop] = {}
       for vf in prop.valuefields

         hash[prop][vf] = {}

       end
     end

     return hash

  end



end
