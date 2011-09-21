module ProductsHelper

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

  def build_products


    for cat in Component.all
      if(cat.component_parents.length == 0)
        print_permuted_products(cat, "")
      end
    end
  end

  def print_permuted_products(component, path)

    path += component.name + "|"

    if(component.components.length != 0)
      for child in component.components

        print_permuted_products(child, path)
      end
    else
      logger.info(path + "\n")
    end


  end

end
