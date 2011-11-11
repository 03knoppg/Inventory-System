module ValidationsHelper
    #Function for displaying validations
  def print_validations
    s = ""
    for valid in @validations
      s+= "<tr>\n"
        s+= "<td> #{valid.extension} </td>\n"
        s+= "<td> #{valid.kind} </td>\n"
        s+= "<td> #{button_to "Show", {:controller => :validations, :action => "show", :id => valid.id }, :method => :get}\n"
        s+= "#{button_to "Edit", edit_validation_path(valid), :method => :get}\n"
        s+= "#{button_to "Delete", {:controller => :validations, :action => "destroy", :id => valid.id }, :confirm => "Are You sure?", :method => :delete}\n</td>"
      s+= "</tr>\n"
    end
    return s
  end
end
