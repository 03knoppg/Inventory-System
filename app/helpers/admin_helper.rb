module AdminHelper

  def full_tree


    root = Category.all[0]
    while !root.parent_id.nil?
      root = root.category
    end


    s = "<ul id=\"abc\" class=\"accordion\">"
    children = root.categories + root.products
    for child in children
      s += recurse_build(child)
    end
    s += "</ul>"

    return s
  end

  def recurse_build(root)
    s = "<li><div class=\"inline\">&nbsp</div>"
    s += "<div class=\"inline\"><a href=\"#\">#{root.name}</a></div>"

    if(root.is_a?(Category))
      children = root.categories + root.products
    elsif(root.is_a?(Product))
      children = root.components
    elsif(root.is_a?(Component))
      children = root.components
    end

    if(!children.nil?)
      s += "<ul>"
      for child in children
        s += recurse_build(child)
      end
      s+="</ul>"
    end

    s += "</li>"

    return s
  end
end
