#Helper file for Categories
module CategoriesHelper

  #Recursive function for display categories - finds parents and then children and organizes them in this way to display.
  def print_categories(parent_id, depth)


    #if nil then empty string, else create table rows and data recursively.
    if(@all_categories_hash[parent_id] == nil)
      return ""
    end

    s = ""

    for parent in @all_categories_hash[parent_id]
      if(parent_id != 0)   #only root category has id 0
        s+= "<tr>\n"
          s+= "<td>#{"-"*depth} #{parent.name }</td>\n"
          s+= "<td>#{button_to "Show", {:controller => :categories, :action => "show", :id => parent.id}, :method => :get}\n"
          s+= "#{button_to "Edit", edit_category_path(parent), :method => :get}\n"
          s+= "#{button_to "Delete", {:controller => :categories, :action => "destroy", :id => parent.id }, :confirm => confirmation_message(parent, @all_categories_hash), :method => :delete}</td>\n"
        s+= "</tr>\n"
      end
      #Calls itself to ensure children of parents are printed. Also increases depth of print to show user parent/child relationship.
      s += print_categories(parent.id, depth+1)
    end

    return s
  end

  #print related products to this category
  def print_related_products(category)
    all_products = category.products
    srp = ""
    srp += "<tr><th>Products related to #{@category.name}</th>"
    srp += "<th>Description</th></tr>"
    if(all_products.empty?)
      srp += "<tr><td>No Products Available</td><td></td></tr>"
    else
      all_products.sort!{|x,y| x.name <=> y.name}  #sort alphabetically
      for prod in all_products
        srp += "<tr><td>#{link_to prod.name, prod}</td>"
        srp += "<td>#{prod.description}</td></tr>"
      end
    end
    return srp
  end

end
