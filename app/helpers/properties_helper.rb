module PropertiesHelper
  #Function for displaying products
  def print_properties
    @all_properties.sort!{|x,y| x.name <=> y.name}  #sort alphabetically
    sa= ""
    for prop in @all_properties
      sa+= "<tr>\n"
        sa+= "<td> #{prop.name} </td>\n"
        sa+= "<td> #{prop.description} </td>\n"
        sa+= "<td> #{prop.field_type} </td>\n"
        sa+= "<td> #{button_to "Show", {:controller => :properties, :action => "show", :id => prop.id }, :method => :get}\n"
        sa+= "#{button_to "Edit", edit_property_path(prop), :method => :get}\n"
        sa+= "#{button_to "Delete", {:controller => :properties, :action => "destroy", :id => prop.id }, :confirm => "Are You sure?", :method => :delete}</td>\n"
        sa+= "</tr>\n"
    end
    return sa
  end

  #Function for displaying Field Values belonging to properties
=begin def properties_field_values_print(property)
    sgc= "<table>"
    if(property.valuefields.empty?)
      sgc+= "<tr><td>No Field Values Available </td></tr>"
    else
      for vf in property.valuefields.sort!{|x,y| x.name <=> y.name}
        sgc+= "<tr><td>#{link_to vf.name, vf}</td></tr>"
      end
    end
    sgc+= "</table>"
    return sgc
  end
=end

  #Function to print properties table
  def print_properties_table(parent, button=true)
    s = "<table class=\"tight_table\">"
    s +=" <tr>"
    s +="  <th align=\"left\">Properties</th>"
    s +="    <th align=\"left\">Values</th>"
    s +="  </tr>"
    properties = parent.properties.sort {|x,y| x.name <=> y.name }

    if(!properties.empty?)
      for prop in properties
        valuefields = prop.valuefields.sort {|x,y| x.name <=> y.name }
        s +="  <tr><td> #{link_to("#{prop.name} (#{prop.field_type})", prop, :target => 'blank')} </td>"

        if(!valuefields.empty?)
          s +=      "<td><table>"
                for val in valuefields

                  s +=        "<tr><td> #{link_to(val.name, val)} </td></tr>"

                end
          if(button)
            s +=       "<tr><td> #{my_button_to "New #{prop.name} Valuefield", new_valuefield_path, [parent, prop]} </td></tr>"
          end

          s +=        "</table></td>"
        else
          s +=        "<td>No valuefields</td>"
        end
        s +=        "</tr>"
      end

    else
      s +=  "<tr><td>No properties</td><td>No values</td></tr>"
    end
    if(button)
      s +=       "<tr><td> #{my_button_to "New Property", new_property_path, [parent]} </td><td>#{my_button_to "New Valuefield", new_valuefield_path, [parent]}</td></tr>"
    end
    s += "</table>"

    return s
  end

   def print_property_table(parent)
    s = "<table style=\"padding-top: 15px\">"
    s +=" <tr>"
    s +="  <th align=\"left\">Property</th>"
    s +="  </tr>"
    prop = parent.property

    if(!prop.nil?)

        s +="  <tr><td> #{link_to("#{prop.name} (#{prop.field_type})", prop)} </td></tr>"

    else
      s +=  "<tr><td>No property</td></tr>"
    end

    s += "</table>"

    return s
  end


end
