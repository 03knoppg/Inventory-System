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

  def print_images_table(parent)
    s = "<table style=\"padding-top: 15px\">"
    s+="    <tr>"
    s+="      <th align=\"left\">Related Images</th>"
    s+="    </tr>"
    if(!parent.images.empty?)
      for img in parent.images
        s+="<tr><td> #{link_to(image_tag(img.picture), img)} </td></tr>"
      end
    else
      s+="        <tr>"
      s+="          <td>No Images</td>"
      s+="        </tr>"
    end
    s+="    <tr>"
    s+="      <td> #{my_button_to "New Image", new_image_path, [parent]} </td>"
    s+="    </tr>"
    s+="  </table>"
  end
end
