#Component Helper File
module ComponentsHelper
  #Recursive function for display components - finds parents and then children and organizes them in this way to display
  def print_components(comp, depth)
    @sc+= "<tr>\n"
      @sc+= "<td> #{"-"*depth} #{comp.name}</td>\n"
      @sc+= "<td> #{button_to "Show", {:controller => :components, :action => "show", :id => comp.id }, :method => :get}\n"
      @sc+= "#{button_to "Edit", edit_component_path(comp), :method => :get}\n"
      @sc+= "#{button_to "Delete", {:controller => :components, :action => "destroy", :id => comp.id }, :confirm => confirmation_message(comp, @all_components_hash), :method => :delete}</td>\n"
      @sc+= "</tr>\n"
    for child in @all_components_hash[comp]
      #calls itself to print children
      print_components(child, depth+1)
    end
  end

   #Recursive function for display components - finds parents and then children and organizes them in this way to display
  def parent_table(cp, depth)

    if(cp.is_a?(Product))
      @pt+= "<option value=\"#{cp.id}\""
    else
      @pt+= "<option value=\"#{-cp.id - 1}\""   #Component ids are set to negative values to differentiate from Product ids
    end

    if (@parent_cps.include?(cp))
      @pt += "selected=true"
    end

    @pt+= ">\n"
    @pt+= "#{"-"*depth}"
    @pt+= "#{cp.name}"
    @pt+= "</option>\n"

    for child in cp.components
        parent_table(child, depth+1)
    end
  end

  #Function to print parents related to the component
  def print_component_parents
     parents = @component.products + @component.component_parents
     @part = ""
      if(parents.length > 1)
        for par in parents
          @part+="<tr><td>#{link_to(par.name, par)}</td></tr>"
        end
      else
        @part+="<tr><td>No Parents Available</td></tr>"
      end
  end

  #Function to print children of component
  def print_component_child
    child = @component.components
    @ch = ""
    if(child.length > 0)
      for chi in child
        @ch+= "<tr><td>#{link_to(chi.name, chi)}</td></tr>"
      end
    else
      @ch+= "<tr><td>No Children Available</td></tr>"
    end
  end

  #Function to print field values related to components
  def print_values_related
    values = @component.valuefields
    @pp= ""
    if(values.length > 0)
      for vf in values
        @pp+= "<tr><td>#{link_to(vf.fieldvalue, vf)}</td><td>#{link_to(vf.property.name, vf.property)}</td></tr>"
      end
    else
      @pp+="<tr><td>No Values Available</td></tr>"
    end
  end
end

