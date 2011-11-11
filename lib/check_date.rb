class CheckDate

  require "rexml/document"
  include REXML

  def check_date(client_date)

    @needs_update = []

    xml_file = File.open("/home/franz2/testXML.xml", "r")

    doc = Document.new(xml_file)

    root = doc.root

    check_need_update(root, client_date)

    return @needs_update

  end

  def check_need_update(elt, client_date)

    date = elt.elements["updated_at"].text

    if(date.to_datetime > client_date)
      @needs_update.push(get_db_obj(elt))

      elt.elements.each do |child|
        if(!child.elements["updated_at"].nil?)
          check_need_update(child, client_date)
        end

      end
    end




  end

  def get_db_obj(elt)

    id = elt.elements["id"].text

    if(elt.name == "Category")
      return Category.find(id)
    elsif(elt.name == "Component")
      return Component.find(id)
    elsif(elt.name == "Product")
      return Product.find(id)
    elsif(elt.name == "Property")
      return Property.find(id)
    elsif(elt.name == "Group")
      return Group.find(id)
    elsif(elt.name == "Valuefield")
      return Valuefield.find(id)
    elsif(elt.name == "DataFile")
      return DataFile.find(id)
    elsif(elt.name == "Image")
      return Image.find(id)
    end
  end

end