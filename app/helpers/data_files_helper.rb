module DataFilesHelper
  #Function for printing Data Files
  def print_data_files
    for daf in @data_files
      @df+= "<tr>\n"
        @df+= "<td> #{text_field_tag("fd", daf.filedata_file_name, :disabled => true, :size => 30)} </td>\n"
        @df+= "<td> #{button_to "Show", {:controller => :data_files, :action => "show", :id => daf.id }, :method => :get}\n"
        @df+= "#{button_to "Edit", edit_data_file_path(daf), :method => :get}\n"
        @df+= "#{button_to "Delete", {:controller => :data_files, :action => "destroy", :id => daf.id }, :confirm => "Are You sure?", :method => :delete}\n</td>"
      if(daf.product != nil)
        @df+= "<td> #{link_to(daf.product.name, daf.product)} </td>\n"
      else
        @df+= "<td>N/A</td>"
      end
      if(daf.component != nil)
      @df+= "<td> #{link_to(daf.component.name, daf.component)} </td>\n"
        else
        @df+= "<td>N/A</td>"
      end
      if(daf.valuefield != nil)
      @df+= "<td> #{link_to(daf.valuefield.fieldvalue, daf.valuefield)} </td>\n"
        else
        @df+= "<td>N/A</td>"
      end

      @df+= "</tr>\n"
    end
  end

    #Recursive function for display components - finds parents and then children and organizes them in this way to display
  def components_table(cp, depth, datafile)

    @pt+= "<option value=\"#{cp.id}\""
    if(datafile != nil && datafile.component == cp)
      @pt+= "selected = \"true\""
    end
    @pt+= ">#{"-"*depth}"
    @pt+= "#{cp.name}"
    @pt+= "</option>\n"

    for child in cp.components
      if(child != @component)
        components_table(child, depth+1, datafile)
      end
    end
  end
end
