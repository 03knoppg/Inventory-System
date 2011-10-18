module ValuefieldsHelper
  def print_value_fields
    @sfv = ""
      for val in @all_valuefields
       @sfv+= "<tr>\n"
          @sfv+= "<td> #{val.fieldvalue} </td>\n"
          @sfv+= "<td> #{button_to "Show", {:controller => :valuefields, :action => "show", :id => val.id }, :method => :get}\n"
          @sfv+= "#{button_to "Edit", edit_valuefield_path(val), :method => :get}\n"
          @sfv+= "#{button_to "Delete", {:controller => :valuefields, :action => "destroy", :id => val.id }, :confirm => "Are You sure?", :method => :delete}</td>\n"
          @sfv+= "<td>#{val.component != nil ? link_to(val.component.name, val.component) : val.component != nil ? link_to(val.product.name, val.product) : ""}</td>"
          @sfv+= "</tr>\n"
      end
  end

  ##########################################################################
  #       PATH WITH NAME
  def get_paths_as_select
  @paths = ""

    for prod in Product.all


      groups_hash = {}
      for comp in prod.components
        if(comp.group == nil)
          groups_hash[comp.name]=[comp]
        else
          if(!groups_hash.has_key?(comp.group.name))

            groups_hash[comp.group.name] = []
          end

          groups_hash[comp.group.name].push(comp)

        end
      end

      path = "<option value=\"~\">" + prod.name + "|"


      print_permuted_components(groups_hash, path, 0)
      get_paths_as_select_id
    end

    for id in @paths_id.split("~")
    #logger.info("\n\n IIIIIIIIIIIIIIIIIIIIIIIIIIIII" + "#{id}" + "\n\n\n\n")

      @paths.sub!("~",id)
    end


    return @paths
  end

  def print_permuted_components(component_group_hash, path, comp_depth)

    if(comp_depth == component_group_hash.keys.length)
      component = Component.find_by_name(path.split("|").last)
      print_attributes(component, path, component_group_hash, comp_depth)
      return
    end

    comp_group = component_group_hash[component_group_hash.keys[comp_depth]]

    for comp in comp_group
      print_attributes(comp, path + comp.name + "|", component_group_hash, comp_depth+1)
      #print_permuted_products(component_group_hash, path + comp.name + "|",comp_depth+1 )
    end

  end

  def print_attributes(component, path, component_group_hash, comp_depth)

    vals_hash = {}

    for val in component.valuefields
      if(!vals_hash.has_key?(val.property.name))
         vals_hash[val.property.name] = []

      end

      vals_hash[val.property.name].push(val)
    end

    print_permuted_values(vals_hash, path, 0, component_group_hash, comp_depth)

  end




  def print_permuted_values(value_group_hash, path, value_depth, component_group_hash, comp_depth)

    if(value_depth == value_group_hash.keys.length)
      if(comp_depth == component_group_hash.keys.length)
         @paths += path + "</option>\n"
         return
      end

      print_permuted_components(component_group_hash, path, comp_depth)
      return
    end

    val_group = value_group_hash[value_group_hash.keys[value_depth]]

    for val in val_group
      print_permuted_values(value_group_hash, path + val.fieldvalue + "|", value_depth+1, component_group_hash, comp_depth)
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

    if(comp_depth == component_group_hash.keys.length)
      component = Component.find(path.split("|").last)
      print_attributes_id(component, path, component_group_hash, comp_depth)
      return
    end

    comp_group = component_group_hash[component_group_hash.keys[comp_depth]]

    for comp in comp_group
      print_attributes_id(comp, path + "c" +  "#{comp.id}" + "|", component_group_hash, comp_depth+1)
      #print_permuted_products(component_group_hash, path + comp.name + "|",comp_depth+1 )
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





