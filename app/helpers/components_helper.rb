module ComponentsHelper

   #Recursive function for display components - finds parents and then children and organizes them in this way to display
  def print_components(parent_id, depth)
    logger.info("@@@@@@@Parent ID Object #{parent_id}")
    if(@all_components_hash[parent_id] == nil)
      #logger.info("If here than bad!")
      return ""
    end
    for com in @all_components_hash[parent_id]
      logger.info("!!!!!!!!print all components hash #{com}")
      @sc+= "<tr>\n"
        @sc+= "<td> #{"-"*depth} #{com.name}</td>\n"
      if(parent_id != 1)
        @sc+= "<td> #{button_to "Show", {:action => "show", :id => com.id }, :method => :get}\n"
        @sc+= "<td> #{button_to "Edit", edit_component_path(com), :method => :get}\n"
        @sc+= "<td> #{button_to "Delete", { :action => "destroy", :id => com.id }, :confirm => confirmation_message(com, @all_components_hash), :method => :delete}\n"
      @sc+= "</tr>\n"
      end
      print_components(com, depth+1)
    end
  end
end
