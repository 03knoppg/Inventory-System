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

    if (!@parent_cps.nil? && @parent_cps.include?(cp))
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
  def print_component_parents
    parents = @component.products + @component.component_parents
    part = ""
    if(!parents.empty?)
      for parent in parents.sort!
        part += "<tr><td>#{link_to(parent.name, parent)}</td></tr>"
      end
    else
      part += "<tr><td>No Parents Available</td></tr>"
    end

    return part
  end

  #Function to print children of component
  def print_component_child
    children = @component.components
    ch = ""
    if(!children.empty?)
      for child in children.sort!
        ch+= "<tr><td>#{link_to(child.name, child)}</td></tr>"
      end
    else
      ch+= "<tr><td>No Children Available</td></tr>"
    end
    #@ch += "<tr><td>#{button_to "New Component", new_component_path, :method => :get}</td></tr>"
    ch += "<tr><td>
              <form method=\"get\" action=\"/components/new\"  class=\"button_to\">
                <div><input type=\"submit\" value=\"New Child Component\" /></div>
                     <input type=\"hidden\" name=\"component_id\" value=\"#{@component.id}\"/>
               </form>
          </td></tr>"

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

