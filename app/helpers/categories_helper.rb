module CategoriesHelper

  #Recursive function for display categories - finds parents and then children and organizes them in this way to display
  def print_categories(parent_id, depth)

    if(@all_categories_hash[parent_id] == nil)
      return ""
    end

    for cat in @all_categories_hash[parent_id]
      if(parent_id != 0)
        @s+= "<tr>\n"
          @s+= "<td> #{"-"*depth} #{cat.name }</td>\n"
          @s+= "<td> #{button_to "Show", {:action => "show", :id => cat.id }, :method => :get}\n"
          @s+= "<td> #{button_to "Edit", edit_category_path(cat), :method => :get}\n"
          @s+= "<td> #{button_to "Delete", { :action => "destroy", :id => cat.id }, :confirm => confirmation_message(cat, @all_categories_hash), :method => :delete}\n"
        @s+= "</tr>\n"
      end
      print_categories(cat.id, depth+1)

    end
  end



end
