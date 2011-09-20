module ComponentsHelper

   #Recursive function for display components - finds parents and then children and organizes them in this way to display
  def print_components(comp, depth)
    @sc+= "<tr>\n"
      @sc+= "<td> #{"-"*depth} #{comp.name}</td>\n"
      @sc+= "<td> #{button_to "Show", {:action => "show", :id => comp.id }, :method => :get}\n"
      @sc+= "<td> #{button_to "Edit", edit_component_path(comp), :method => :get}\n"
      @sc+= "<td> #{button_to "Delete", { :action => "destroy", :id => comp.id }, :confirm => confirmation_message(comp, @all_components_hash), :method => :delete}\n"
      @sc+= "</tr>\n"
    for child in @all_components_hash[comp]

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
      @pt += "endselected=true"
    end

    @pt+= ">\n"
    @pt+= "#{"-"*depth}"
    @pt+= "#{cp.name}"
    @pt+= "</option>\n"

    for child in cp.components
        parent_table(child, depth+1)
    end
  end
end
