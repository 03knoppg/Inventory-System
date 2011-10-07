module ImagesHelper
    #Recursive function for display components - finds parents and then children and organizes them in this way to display
  def components_table(cp, depth)

    @pt+= "<option value=\"#{cp.id}\">\n"
    @pt+= "#{"-"*depth}"
    @pt+= "#{cp.name}"
    @pt+= "</option>\n"

    for child in cp.components
      if(child != @component)
        components_table(child, depth+1)
      end
    end
  end
end
