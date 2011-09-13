module ApplicationHelper


  def print_categories(parent_id, depth)
    #logger.info("+++++++++++++++++++++++++++I'm looking for this: #{@tmp_array.inspect}")

    if(@all_categories_hash[parent_id] == nil)
      return ""
    end

    for cat in @all_categories_hash[parent_id]
      @s+= "<tr>\n"
        @s+= "<td> #{cat.id  } </td>\n"
        #@s+= "<td> #{cat.parent_id }</td>"
        @s+= "<td> #{"-"*depth} #{cat.name }</td>\n"
        @s+= "<td> #{link_to 'Show', cat }</td>\n"
        @s+= "<td> #{link_to 'Edit', edit_category_path(cat) }</td>\n"
        @s+= "<td> #{button_to "Delete", { :action => "destroy", :id => cat.id }, :confirm => confirmation_message(cat), :method => :delete}\n"
        #@s+= "<td> #{link_to 'Destroy', cat, confirm: confirmation_message(cat) , method: :delete }</td>"
        #@s+= "<td> #{link_to 'Destroy', cat, confirm: 'Are you sure' , method: :delete  }</td>"
      @s+= "</tr>\n"
      

      print_categories(cat.id, depth+1)

    end
  end

  def confirmation_message(cat)
      if(@all_categories_hash[cat.id] == nil)
        return 'Are you sure?'
      else
        return 'This node has children. If you delete this node the children will also be deleted. Are you sure?'
      end
  end



end
