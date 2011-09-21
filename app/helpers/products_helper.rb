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


end
