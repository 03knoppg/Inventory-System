module PropertiesHelper
  #Function for displaying products
  def print_properties
    @all_properties.sort!{|x,y| x.name <=> y.name}  #sort alphabetically
    for prop in @all_properties
      @sa+= "<tr>\n"
        @sa+= "<td> #{prop.name} </td>\n"
        @sa+= "<td> #{prop.description} </td>\n"
        @sa+= "<td> #{prop.field_type} </td>\n"
        @sa+= "<td> #{button_to "Show", {:controller => :properties, :action => "show", :id => prop.id }, :method => :get}\n"
        @sa+= "#{button_to "Edit", edit_property_path(prop), :method => :get}\n"
        @sa+= "#{button_to "Delete", {:controller => :properties, :action => "destroy", :id => prop.id }, :confirm => "Are You sure?", :method => :delete}</td>\n"
        @sa+= "<td>#{properties_field_values_print(prop)}</td>"
        @sa+= "</tr>\n"
    end
  end

  #Function for displaying Field Values belonging to properties
  def properties_field_values_print(property)
    sgc= "<table>"
    if(property.valuefields.empty?)
      sgc+= "<tr><td>No Field Values Available </td></tr>"
    else
      for vf in property.valuefields
        sgc+= "<tr><td>#{link_to vf.fieldvalue, vf}</td></tr>"
      end
    end
     sgc+= "</table>"
  end
end
