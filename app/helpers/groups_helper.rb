module GroupsHelper
  #Function for display groups
  def print_groups(group)
    sg= "<tr>\n"
    sg+= "<td> #{group.name}</td>\n"
    sg+= "<td> #{button_to "Show", {:controller => :groups, :action => "show", :id => group.id }, :method => :get}\n"
    sg+= "#{button_to "Edit", edit_group_path(group), :method => :get}\n"
    sg+= "#{button_to "Delete", {:controller => :groups, :action => "destroy", :id => group.id }, :confirm => "Are you sure?", :method => :delete}</td>\n"
    sg+= "<td>#{group_component_print(group)}</td>"
    sg+= "</tr>\n"
    return sg
  end

  #Function for displaying components belonging to groups
  def group_component_print(group)
    sgc= "<table>"
    if(group.components.empty?)
      sgc+= "<tr><td>No Components Available </td></tr>"
    else
    for comp in group.components.sort {|x,y| x.name <=> y.name }
        sgc+= "<tr><td>#{link_to comp.name, comp}</td></tr>"
    end
    sgc+= "</table>"
    end
    return sgc
  end
end