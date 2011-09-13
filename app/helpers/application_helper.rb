module ApplicationHelper


  #Recursive function for display categories - finds parents and then children and organizes them in this way to display
  def print_categories(parent_id, depth)

    if(@all_categories_hash[parent_id] == nil)
      return ""
    end

    for cat in @all_categories_hash[parent_id]
      @s+= "<tr>\n"
        @s+= "<td> #{cat.id  } </td>\n"
        @s+= "<td> #{"-"*depth} #{cat.name }</td>\n"
        @s+= "<td> #{button_to "Show", {:action => "show", :id => cat.id }, :method => :get}\n"
        @s+= "<td> #{button_to "Edit", edit_category_path(cat), :method => :get}\n"
        @s+= "<td> #{button_to "Delete", { :action => "destroy", :id => cat.id }, :confirm => confirmation_message(cat), :method => :delete}\n"

      @s+= "</tr>\n"
      print_categories(cat.id, depth+1)

    end
  end

  #Function for displaying products
  def print_products
    if(@all_products == nil)
      return ""
    end
    @all_products.sort!{|x,y| x.name <=> y.name}  #sort alphabetically
    for prod in @all_products
      @sp+= "<tr>\n"
        @sp+= "<td> #{prod.name} </td>\n"
        @sp+= "<td> #{prod.description} </td>\n"
        @sp+= "<td> #{button_to "Show", {:action => "show", :id => prod.id }, :method => :get}\n"
        @sp+= "<td> #{button_to "Edit", edit_product_path(prod), :method => :get}\n"
        @sp+= "<td> #{button_to "Delete", { :action => "destroy", :id => prod.id }, :confirm => "Are You sure?", :method => :delete}\n"

      @sp+= "</tr>\n"
    end
  end

  #Function for displaying customer message - used for deleting categories that are parents that contain children
  def confirmation_message(cat)
      if(@all_categories_hash[cat.id] == nil)
        return 'Are you sure?'
      else
        return 'This node has children. If you delete this node the children will also be deleted. Are you sure?'
      end
  end
end
