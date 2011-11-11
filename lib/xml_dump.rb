class XmlDump




def xml_dump

    root = Category.all[0]
    while !root.parent_id.nil?
      root = root.category
    end

    hash = Hash.new

    hash[root] = build_full_hash(root)

    xml_string = xml_from_hash(root, hash)

    write_to_file("/home/franz2/testXML.xml", xml_string)

  end

  def write_to_file(path,text)

    File.open(path, 'w') {|f| f.write(text) }

  end


  def build_full_hash(node)

    hash = Hash.new


    if(node.is_a?(Category))
       children = node.categories + node.products
    elsif(node.is_a?(Product))
      children = node.components
    elsif(node.is_a?(Component))
      children = node.components + node.properties + node.images + node.data_files + [node.group]
    elsif(node.is_a?(Valuefield))
      children = node.images + node.data_files
    elsif(node.is_a?(Property))
      children = node.valuefields
    else
      return {}
    end

    for child in children
        hash[child] = build_full_hash(child)
    end

    return hash
  end


  def xml_from_hash(node, hash)
    xml = to_xml_string(node)
    for key in hash[node].keys
      if(!key.nil?)
        index = xml.rindex("</#{node.class.name}>")
        xml.insert(index,xml_from_hash(key, hash[node]))
      end

    end


    return xml

  end

def to_xml_string(element)

   if(element == nil)
     return ""
   end

   xml = "<#{element.class}>"

   for key in element.attributes.keys
     xml += "<#{key}"
     if(element.attributes[key].nil?)
       xml += " nil=\"true\">"
     else
       xml += ">#{element.attributes[key]}"
     end
     xml += "</#{key}>"
   end

=begin
 data = element.data_files
   for datum in data
     xml += "<Datafile>"
     for elt in datum.attributes.keys
       xml += "<#{elt}"
       if(datum.attributes[elt].nil?)
         xml += " nil=\"true\">"
       else
         xml += ">#{datum.attributes[elt]}"
       end
       xml += "</#{elt}>"
     end
     xml += "</Datafile>"
   end

   images = element.images
   for image in images
     xml += "<Image>"
     for elt in image.attributes.keys
       xml += "<#{elt}"
       if(image.attributes[elt].nil?)
         xml += " nil=\"true\">"
       else
         xml += ">#{image.attributes[elt]}"
       end
       xml += "</#{elt}>"
     end
     xml += "</Image>"
   end

   if(element.is_a?(Category))
     xml += "<Categories></Categories>"
     xml += "<Products></Products>"
   elsif(element.is_a?(Product))
     xml += "<Components></Components>"
     xml += "<Valuefields></Valuefields>"
   elsif(element.is_a?(Component))
     xml += "<Components></Components>"
     xml += "<Valuefields></Valuefields>"
   end
=end

   xml += "</#{element.class}>"

   return xml

 end


end