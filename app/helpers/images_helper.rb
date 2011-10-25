module ImagesHelper


  #Function for displaying images
  def print_images

    sp = ""

    for img in @all_images
      sp+= "<tr>\n"
      sp+= "<td> #{image_tag(img.picture.url(:small))} </td>\n"
        sp+= "<td> #{button_to "Show", {:controller => :images, :action => "show", :id => img.id }, :method => :get}\n"
        sp+= "#{button_to "Edit", edit_image_path(img), :method => :get}\n"
        sp+= "#{button_to "Delete", {:controller => :images, :action => "destroy", :id => img.id }, :confirm => "Are You sure?", :method => :delete}\n</td>"
      sp+= "</tr>\n"
    end

    return sp
  end
end
