module ImagesHelper
  #Function for displaying images
  def print_images
    sp = ""
    for img in @all_images
      sp+= "<tr>\n"
      sp+= "<td> #{image_tag(img.picture.url(:small))} </td>\n"
      sp+= "<td>#{img.picture_file_name}</td>"
      sp+= "<td> #{button_to "Show", {:controller => :images, :action => "show", :id => img.id }, :method => :get}\n"
      sp+= "#{button_to "Edit", edit_image_path(img), :method => :get}\n"
      sp+= "#{button_to "Delete", {:controller => :images, :action => "destroy", :id => img.id }, :confirm => "Are You sure?", :method => :delete}\n</td>"
      sp+= "</tr>\n"
    end
    return sp
  end

  #Function for printing images table
  def print_images_table(parent, button=true)
    s = "<table class=\"tight_table\">"
    s+="    <tr>"
    s+="      <th align=\"left\">Images</th><th>Image Name</th>"
    s+="    </tr>"
    if(!parent.images.empty?)
      for img in parent.images
        s+="<tr><td> #{link_to(image_tag(img.picture.url(:small)), img)} </td><td>#{img.picture_file_name}</td></tr>"
      end
    else
      s+="        <tr>"
      s+="          <td>No Images</td>"
      s+="        </tr>"
    end
    s+="    <tr>"
    if(button)
      s+="      <td> #{my_button_to "New Image", new_image_path, [parent]} </td>"
    end
    s+="    </tr>"
    s+="  </table>"
  end
end
