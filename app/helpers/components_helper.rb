module ComponentsHelper

   #Recursive function for display components - finds parents and then children and organizes them in this way to display
  def print_components(parent_id, depth)
    logger.info("@@@@@@@depth#{depth}")
    #if(@all_components_hash[parent_id] == nil)
      #logger.info("If here than bad!")
      #return ""
    #end
    #var1 = @all_components_hash
    #var2 = @all_components_hash[parent_id]
    #var3 = var2[0]
    for var4 in @all_components_hash[parent_id]
      #if(depth != 0)
        logger.info("!!!!!!!!depth #{depth}")
        @sc+= "<tr>\n"
          @sc+= "<td> #{"-"*depth} #{var4.name}</td>\n"
          @sc+= "<td> #{button_to "Show", {:action => "show", :id => var4.id }, :method => :get}\n"
          @sc+= "<td> #{button_to "Edit", edit_component_path(var4), :method => :get}\n"
          @sc+= "<td> #{button_to "Delete", { :action => "destroy", :id => var4.id }, :confirm => confirmation_message(var4, @all_components_hash), :method => :delete}\n"
        @sc+= "</tr>\n"
      #end
      print_components(var4, depth+1)
    end
  end
end
