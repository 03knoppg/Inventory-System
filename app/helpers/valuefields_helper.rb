module ValuefieldsHelper

  def get_paths_as_select


    for prod in Product.all
      groups_hash = {}
      for comp in prod.components

        if(!groups_hash.has_key?(comp.group.name))
          groups_hash[comp.group.name] = []
        end

        groups_hash[comp.group.name].push(comp)

        end
      end

      path = "<option>" + prod.name + "|"

      print_permuted_products(groups_hash, path, 0)


    return @paths
  end

  def print_permuted_products(component_group_hash, path, depth)

    if(depth == component_group_hash.keys.length)
      component = Component.find_by_name(path.split("|").last)
      print_attributes(component, path)
      return
    end

    comp_group = component_group_hash[component_group_hash.keys[depth]]

    for comp in comp_group
      print_permuted_products(component_group_hash, path + comp.name + "|", depth+1)
    end

  end

  def print_attributes(component, path)

    vals_hash = {}

    for val in component.valuefields
      if(!vals_hash.has_key?(val.property.name))
         vals_hash[val.property.name] = []

      end

      vals_hash[val.property.name].push(val)
    end

    logger.info("\n\n IIIIIIIIIIIIIIIIIIIIIIIIIIIII" + "#{vals_hash.keys.length}" + "\n\n\n\n")
    print_permuted_values(vals_hash, path, 0)

  end




  def print_permuted_values(value_group_hash, path, depth)

    if(depth == value_group_hash.keys.length)
      @paths += path + "</option>\n"
      return
    end

    val_group = value_group_hash[value_group_hash.keys[depth]]

    for val in val_group
      print_permuted_values(value_group_hash, path + val.fieldvalue + "|", depth+1)
    end

  end
end





