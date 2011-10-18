module ProductsHelper

   #Function for displaying products
  def print_products

    sp = ""
    for prod in @all_products
      sp+= "<tr>\n"
        sp+= "<td> #{prod.name} </td>\n"
        sp+= "<td> #{prod.description} </td>\n"
        sp+= "<td> #{prod.code} </td>\n"
        sp+= "<td> #{button_to "Show", {:controller => :products, :action => "show", :id => prod.id }, :method => :get}\n"
        sp+= "#{button_to "Edit", edit_product_path(prod), :method => :get}\n"
        sp+= "#{button_to "Delete", {:controller => :products, :action => "destroy", :id => prod.id }, :confirm => "Are You sure?", :method => :delete}\n</td>"
        #sp+= "<td>#{product_component_print(prod)}</td>"
      sp+= "</tr>\n"
    end

    return sp
  end

   #Function for displaying components belonging to products
  def product_component_print(product)
    sgc= "<table>"
    if(product.components.empty?)
      sgc+= "<tr><td>No Components Available </td></tr>"
    else
      for comp in product.components.sort {|x,y| x.name <=> y.name }
          sgc+= "<tr><td>#{link_to comp.name, comp}</td></tr>"
      end

    end
    sgc+= "</table>"
    return sgc
  end
end
