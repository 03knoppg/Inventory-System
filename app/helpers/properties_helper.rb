module PropertiesHelper
   #Function for displaying products
  def print_properties
    if(@all_properties == nil)
      return ""
    end
    @all_properties.sort!{|x,y| x.name <=> y.name}  #sort alphabetically
    for prop in @all_properties
      @sa+= "<tr>\n"
        @sa+= "<td> #{prop.name} </td>\n"
        @sa+= "<td> #{prop.description} </td>\n"
        @sa+= "<td> #{button_to "Show", {:action => "show", :id => prop.id }, :method => :get}\n"
        @sa+= "<td> #{button_to "Edit", edit_property_path(prop), :method => :get}\n"
        @sa+= "<td> #{button_to "Delete", { :action => "destroy", :id => prop.id }, :confirm => "Are You sure?", :method => :delete}\n"
        @sa+= "</tr>\n"
    end
  end
end
