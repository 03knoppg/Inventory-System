module ProductsHelper

   #Function for displaying products
  def print_products
    @all_products.sort!{|x,y| x.name <=> y.name}  #sort alphabetically
    for prod in @all_products
      @sp+= "<tr>\n"
        @sp+= "<td> #{prod.name} </td>\n"
        @sp+= "<td> #{prod.description} </td>\n"
        @sp+= "<td> #{button_to "Show", {:controller => :products, :action => "show", :id => prod.id }, :method => :get}\n"
        @sp+= "#{button_to "Edit", edit_product_path(prod), :method => :get}\n"
        @sp+= "#{button_to "Delete", {:controller => :products, :action => "destroy", :id => prod.id }, :confirm => "Are You sure?", :method => :delete}\n</td>"
        @sp+= "<td>#{product_component_print(prod)}</td>"
      @sp+= "</tr>\n"
    end
  end

   #Function for displaying components belonging to products
  def product_component_print(product)
    sgc= "<table>"
    if(product.components.empty?)
      sgc+= "<tr><td>No Components Available </td></tr>"
    else
    for comp in product.components
        sgc+= "<tr><td>#{link_to comp.name, comp}</td></tr>"
    end
    sgc+= "</table>"
    end
    return sgc;
  end
end
