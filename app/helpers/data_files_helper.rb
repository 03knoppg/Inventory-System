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
      df+= "</tr>\n"
    end

    return df
  end

  #Function to print data files
  def print_datafiles_table(parent)
    s = "<table class=\"tight_table\">"
    s+="    <tr>"
    s+="      <th align=\"left\">Related Data Files</th>"
    s+="    </tr>"
    if(!parent.data_files.empty?)
      for df in parent.data_files
        s+="            <tr><td> #{link_to(df.filedata_file_name, df)} </td></tr>"
      end
    else
      s+="        <tr>"
      s+="          <td>No Data Files</td>"
      s+="        </tr>"
    end
    s+="    <tr>"
    s+="      <td> #{my_button_to "New Data File", new_data_file_path, [@component]} </td>"
    s+="    </tr>"
    s+="  </table>"
    return s
  end

end
