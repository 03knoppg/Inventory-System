#Component Helper File
module ComponentsHelper
  #Recursive function for display components - finds parents and then children and organizes them in this way to display
  def print_components(comp, depth)
    sc = ""
    sc+= "<tr>\n"
    sc+= "<td> #{"-"*depth} #{comp.name}</td>\n"
    sc+= "<td> #{comp.description}</td>\n"
    sc+= "<td> #{button_to "Show", {:controller => :components, :action => "show", :id => comp.id }, :method => :get}\n"
    sc+= "#{button_to "Edit", edit_component_path(comp), :method => :get}\n"
    sc+= "#{button_to "Delete", {:controller => :components, :action => "destroy", :id => comp.id }, :confirm => confirmation_message(comp, @all_components_hash), :method => :delete}</td>\n"
    sc+= "</tr>\n"

    for child in @all_components_hash[comp].sort!
      #calls itself to print children
      sc += print_components(child, depth+1)
    end

    return sc
  end

  #Recursive function for display components - finds parents and then children and organizes them in this way to display
  def parent_table(cp, depth)

    pt=""

    if(cp.is_a?(Product))
      pt += "<option value=\"#{cp.id}\""
    else
      pt += "<option value=\"#{-cp.id - 1}\""   #Component ids are set to negative values to differentiate from Product ids
    end

    if (!@items_to_select.nil? && @items_to_select.include?(cp))
      pt += "selected=\"true\""
    end

    pt += ">
           #{"-"*depth}#{cp.name}
          </option>\n"

    for child in cp.components.sort!
      if(child != @component)
        pt += parent_table(child, depth+1)
      end
    end

    return pt

  end


  #Function to print parents related to the component
  def print_component_parents_table(parent)

    items = parent.component_parents
    part = "<table>"
    part += "<tr><th align=\"Left\">Parent Components</th></tr>"

    if(!items.empty?)
      for comp in items.sort!
        part += "<tr><td>#{link_to(comp.name, comp, :target => 'blank')}</td></tr>"
      end
    else
      part += "<tr><td>No Parents Available</td></tr>"
    end
    part += "</table>"
    return part
  end

  #Function to print children of component
  def print_components_table (parent, button=true)

    children = parent.components
    ch = "<table class=\"tight_table\">"
    ch +="<tr><th align=\"Left\">Components</th></tr>"
    if(!children.empty?)
      for child in children.sort!
        ch+= "<tr><td>#{link_to(child.name, child, :target => 'blank')}</td></tr>"
      end
    else
      ch+= "<tr><td>No Components Available</td></tr>"
    end
    if(button)
      ch += "<tr><td>#{my_button_to( "New Child Component", "/components/new", [parent])}</td></tr>"
    end
    ch += "</table>"
    return ch

  end

  #Function to print field values related to components     --Unused--
  def print_values_related
    values = @component.valuefields.sort!
    pp= ""
    if(!values.empty?)
      for vf in values
        pp+= "<tr><td>#{link_to(vf.fieldvalue, vf)}</td><td>#{link_to(vf.property.name, vf.property)}</td></tr>"
      end
    else
      pp+="<tr><td>No Values Available</td><td></td></tr>"
    end

    pp += "<tr><td>#{button_to "New Valuefield", new_valuefield_path, :method => :get}</td></tr>"

    return pp
  end

  #Prints value fields related to a component and selects value if one is related
  def properties_VF_table
    if(@component_use != nil)
      selected_valuefields = @component_use.valuefields
    else
      selected_valuefields = @component.valuefields
    end
    s = ""
    for property in @all_properties.sort!
      s += "<option value=\"#{property.id}\">#{property.name} (#{property.field_type})</option>"
      for valuefield in property.valuefields.sort!
        s += "<option value=\"#{valuefield.id}\""
        if selected_valuefields.include?(valuefield)
          s+= " selected=\"true\""
        end
        s+=">---#{valuefield.fieldvalue}</option>"
      end
    end
    return s
  end
end

