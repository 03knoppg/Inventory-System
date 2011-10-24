module ValuefieldsHelper
  def print_value_fields
    @sfv = ""
     if(@all_valuefields == nil)
      return ""
     end
    sfv = ""
    for val in @all_valuefields
     sfv+= "<tr>\n"
        sfv+= "<td> #{val.fieldvalue} </td>\n"
        if(!val.property.nil?)
          sfv+= "<td> #{link_to val.property.name, val.property} </td>\n"
        else
          sfv+= "<td></td>"
        end
        sfv+= "<td> #{button_to "Show", {:controller => :valuefields, :action => "show", :id => val.id }, :method => :get}\n"
        sfv+= "#{button_to "Edit", edit_valuefield_path(val), :method => :get}\n"
        sfv+= "#{button_to "Delete", {:controller => :valuefields, :action => "destroy", :id => val.id }, :confirm => "Are You sure?", :method => :delete}</td>\n"
        sfv+= "</tr>\n"
    end
    return sfv

  end

  ##########################################################################
  #       PATH WITH NAME
  def get_paths_as_select
    @paths = ""                      #global to store each <option> for html
    @child_depth = 0                 #incremented when recursing into components that are children of components




    for prod in Product.all
        create_comp_hash(prod, "<option value=\"~\">#{prod.name}|", {})
    end

    #substitute the id path into the value of each option tag
    if(!@paths_id.nil?)
      for id in @paths_id.split("~")
        @paths.sub!("~",id)
      end
    end



    return @paths
  end

  #create a hash like {group1=>[component1, component2...], group2=> ...}
  # of all the child components of parent
  def create_comp_hash(parent, path, groups_hash)

      for comp in parent.components
        if(comp.group == nil)
          groups_hash[comp]=[comp]
        else
          if(!groups_hash.has_key?(comp.group))

            groups_hash[comp.group] = []
          end

          groups_hash[comp.group].push(comp)

        end

      end


      if(!groups_hash.empty?)
        #create a set of paths by name for dispaly and a set of paths by id for storing in the data base
        print_permuted_components(groups_hash, path, 0)
        get_paths_as_select_id
      end


  end


  #comp_depth represents the current group (OR block) from the group_hash
  def print_permuted_components(component_group_hash, path, comp_depth)

    if(comp_depth > 0 && comp_depth == component_group_hash.keys.length)
      #we are done adding components
      component = Component.find_by_name(path.split("|").last)
      create_valuefield_hash(component, path, component_group_hash, comp_depth)
      return

    elsif(comp_depth == 0 && comp_depth == component_group_hash.keys.length)
      #add products that have no components
      @paths += path.split("|").last
      return
    end

    #get the current group (OR block) of components
    comp_group = component_group_hash[component_group_hash.keys[comp_depth]]

    for comp in comp_group
      #each component in the group creates a new permutational path
      create_valuefield_hash(comp, path + comp.name + "|", component_group_hash, comp_depth+1)
    end

  end


  #create a hash like {property1=>[valuefield1, valuefield1...], property2=> ...}
  #of all the valuefields of component
  def create_valuefield_hash(component, path, component_group_hash, comp_depth)

    if(component.nil?)
      return
    end

    vals_hash = {}

    for val in component.valuefields
      if(!vals_hash.has_key?(val.property))
         vals_hash[val.property] = []

      end

      vals_hash[val.property].push(val)
    end

    print_valuefields(component, vals_hash, path, 0, component_group_hash, comp_depth)

  end



  #add valuefields to the path
  def print_valuefields(component, value_group_hash, path, value_depth, component_group_hash, comp_depth)

    if(value_depth == value_group_hash.keys.length)    #done adding valuefields for this component


      #create_comp_hash(component, "", {})   #recurse into children (currently broken)


      if(comp_depth == component_group_hash.keys.length) #done adding components
        if(@child_depth == 0)                            #do not print unless we are at top level
          @paths += path + "</option>\n"                 #this path is done, save it to @paths
        end

        return
      end

      print_permuted_components(component_group_hash, path, comp_depth)   #done adding valuefields, go to next component

      return
    end

    val_group = value_group_hash[value_group_hash.keys[value_depth]]

    for val in val_group  #go to next valuefield
      print_valuefields(component, value_group_hash, path + val.fieldvalue + "|", value_depth+1, component_group_hash, comp_depth)
    end

  end

  ##########################################################################
  #       PATH WITH ID
     def get_paths_as_select_id

  @paths_id = ""
    for prod in Product.all


      groups_hash = {}
      for comp in prod.components
        if(comp.group == nil)
          groups_hash["c#{comp.id}"]=[comp]
        else
          if(!groups_hash.has_key?("g#{comp.group.id}"))

            groups_hash["g#{comp.group.id}"] = []
          end

          groups_hash["g#{comp.group.id}"].push(comp)

        end
      end


     # path = "<option>" + "p" + "#{prod.id}" + "|"
      path = "p" + "#{prod.id}" + "|"

      print_permuted_components_id(groups_hash, path, 0)

    end

    return @paths_id
  end

  def print_permuted_components_id(component_group_hash, path, comp_depth)

    if(comp_depth > 0 && comp_depth == component_group_hash.keys.length)
      component = Component.find(path.split("|").last)
      print_attributes_id(component, path, component_group_hash, comp_depth)
      return
    elsif(comp_depth == 0 && comp_depth == component_group_hash.keys.length)
       @paths_id += path.split("|").last
      #return
    end

    comp_group = component_group_hash[component_group_hash.keys[comp_depth]]

    if(!comp_group.nil?)
      for comp in comp_group
        print_attributes_id(comp, path + "c" +  "#{comp.id}" + "|", component_group_hash, comp_depth+1)
        #print_permuted_products(component_group_hash, path + comp.name + "|",comp_depth+1 )
      end
    end


  end

  def print_attributes_id(component, path, component_group_hash, comp_depth)

    vals_hash = {}

    for val in component.valuefields
      if(!vals_hash.has_key?("v#{val.property.id}"))
         vals_hash["v#{val.property.id}"] = []

      end

      vals_hash["v#{val.property.id}"].push(val)
    end

    #logger.info("\n\n IIIIIIIIIIIIIIIIIIIIIIIIIIIII" + "#{vals_hash.inspect}" + "\n\n\n\n")
    print_permuted_values_id(vals_hash, path, 0, component_group_hash, comp_depth)

  end




  def print_permuted_values_id(value_group_hash, path, value_depth, component_group_hash, comp_depth)

    if(value_depth == value_group_hash.keys.length)
      if(comp_depth == component_group_hash.keys.length)
         @paths_id += path + "~"
         return
      end

      print_permuted_components_id(component_group_hash, path, comp_depth)
      return
    end

    val_group = value_group_hash[value_group_hash.keys[value_depth]]

    for val in val_group
      print_permuted_values_id(value_group_hash, path + "v" +  "#{val.id}" + "|", value_depth+1, component_group_hash, comp_depth)
    end

  end

  def id_path_to_name_path(id_path)

    name_path = "<p>"

    for id in id_path.split("|")
      if(id[0] == 'p')
        name_path += "<b> #{Product.find(id[1..(id.length)]).name} </b><br/>"
      elsif(id[0] == 'c')
        name_path += "<br/><b>#{Component.find(id[1..(id.length)]).name}</b>"
      elsif(id[0] == "v")
        name_path += "  #{Valuefield.find(id[1..(id.length)]).fieldvalue}"
      end
    end

    return name_path + "<p/>"

  end

end





