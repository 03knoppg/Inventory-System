module DataFilesHelper
  #Function for printing Data Files
  def print_data_files

    df = ""

    for daf in @data_files
      df+= "<tr>\n"
        df+= "<td> #{text_field_tag("fd", daf.filedata_file_name, :disabled => true, :size => 30)} </td>\n"
        df+= "<td> #{button_to "Show", {:controller => :data_files, :action => "show", :id => daf.id }, :method => :get}\n"
        df+= "#{button_to "Edit", edit_data_file_path(daf), :method => :get}\n"
        df+= "#{button_to "Delete", {:controller => :data_files, :action => "destroy", :id => daf.id }, :confirm => "Are You sure?", :method => :delete}\n</td>"
      if(daf.product != nil)
        df+= "<td> #{link_to(daf.product.name, daf.product)} </td>\n"
      else
        df+= "<td>N/A</td>"
      end
      if(daf.component != nil)
      df+= "<td> #{link_to(daf.component.name, daf.component)} </td>\n"
        else
        df+= "<td>N/A</td>"
      end
      if(daf.valuefield != nil)
      df+= "<td> #{link_to(daf.valuefield.fieldvalue, daf.valuefield)} </td>\n"
        else
        df+= "<td>N/A</td>"
      end

      df+= "</tr>\n"
    end

    return df
  end

end
