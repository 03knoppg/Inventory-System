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

    for prod in Product.all
      if(prod.components.length > 0)
        for comp in prod.components
          print_permuted_products(comp, prod.name + "|")
        end
      end
    end
  end

  def print_permuted_products(component, path)

    path += component.name

    if(component.components.length != 0)
      path +=  "|"
      for child in component.components
        print_permuted_products(child, path)
      end
    else
      logger.info(path + "\n")
    end
  end

   def add_test_price(path)
    #price = Valuefield.new()
    #price.permutation = true;
    #price.path = path
    #price.fieldvalue = "$200"

  end

end
