module AttributesHelper
   #Function for displaying products
  def print_attributes
    if(@all_attributes == nil)
      return ""
    end
    @all_attributes.sort!{|x,y| x.name <=> y.name}  #sort alphabetically
    for att in @all_attributes
      @sa+= "<tr>\n"
        @sa+= "<td> #{att.name} </td>\n"
        @sa+= "<td> #{att.description} </td>\n"
        @sa+= "<td> #{button_to "Show", {:action => "show", :id => att.id }, :method => :get}\n"
        @sa+= "<td> #{button_to "Edit", edit_attribute_path(att), :method => :get}\n"
        @sa+= "<td> #{button_to "Delete", { :action => "destroy", :id => att.id }, :confirm => "Are You sure?", :method => :delete}\n"
        @sa+= "</tr>\n"
    end
  end
end
