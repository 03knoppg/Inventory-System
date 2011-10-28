#Helper file for Categories
module CategoriesHelper

  #Recursive function for display categories - finds parents and then children and organizes them in this way to display.
  def print_categories(parent_id, depth)
    s = ""
    #if nil then empty string, else create table rows and data recursively.
    if(@all_categories_hash[parent_id] == nil)
      return ""
    end
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
    s
  end

  #print related category children to this category
  def print_related_children
    child = []
    c = "<tr><th>Related Child Categories</th></tr>"
    #creates an array of children
    for cat in @all_categories
      if(cat.parent_id.eql?(@category.id))
        child.push(cat)
      end
    end
    #Checks if array is empty
    if(!child.empty?)
      #Creates a table row and data for each child
      for ch in child.sort!{|x,y| x.name <=> y.name}
        c += "<tr><td class=\"td_two_col\">#{link_to ch.name, ch}</td></tr>"
      end
    else
      c += "<tr><td>No Child Categories Available</td></tr>"
    end
    c
  end

  #print related products to this category
  def print_related_products
    srp = ""
    srp += "<tr><th>Related Products</th>"
    srp += "<th>Description</th></tr>"
    if(@related_products.empty?)
      srp += "<tr><td>No Products Available</td><td></td></tr>"
    else
        #sort alphabetically
      for prod in @related_products
        srp += "<tr><td class=\"td_two_col\">#{link_to prod.name, prod}</td>"
        srp += "<td>#{prod.description}</td></tr>"
      end
    end
    srp
  end
end
