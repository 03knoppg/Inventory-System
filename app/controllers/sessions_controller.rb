class SessionsController < ApplicationController
  require "rexml/document"
  include REXML
  skip_before_filter :require_login, :except => [:destroy]

  def index
    redirect_to login_url
  end

  def new



    if(params[:TYPE] != nil)

      php_args = []
      php_args.push(params[:TYPE])
      php_args.push(params[:BACKTYPE])
      php_args.push(params[:CONTROL])
      php_args.push(params[:ARMS])
      php_args.push(params[:OPTIONS])
      php_args.push(params[:FABRIC])

      hash = all_seating_path_translator(php_args)
      hash = all_seating_expand_hash(hash)

      test_dir = "/var/www/allseating/bin/chairs/textures/Series82_0_19/"
      generic_xml_path = test_dir + "testFile.xml"

      generic_xml = all_seating_xml_from_hash(hash.keys[0], hash)
      all_seating_write_to_file(generic_xml_path, generic_xml)

      #get textures
      all_seating_texture_xml(generic_xml_path, test_dir)

      #get dae
      all_seating_dae(generic_xml_path, test_dir)

      #get models
      all_seating_texture(generic_xml_path, test_dir)

    end

  end



  def create
    user = login(params[:username], params[:password], params[:remember_me])
    if user
      redirect_back_or_to admin_path, :notice => "Logged in!"
    else
      flash[:alert] = "Email or password was invalid."
      redirect_to login_url
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end


  def all_seating_expand_hash(hash)

    root = hash.keys[0]
    children = []

    for childhash in hash[root]
        all_seating_expand_hash(childhash)
    end

    if(root.is_a?(Product))
      children = root.components
    elsif(root.is_a?(Component))
      children = root.components + root.valuefields
    end

    for child in children
      if(!find(hash[root], child))
        childhash = {child=>[]}
        hash[root].push(childhash)
        all_seating_expand_hash(childhash)
      end

    end



    return hash
  end


  def find(ary, obj)
    for hash in ary
      if(hash.keys[0].class != obj.class)
        next
      elsif(hash.keys[0] == obj )
        return true
      elsif(obj.is_a?(Component) && !hash.keys[0].group.nil? && !obj.group.nil? && hash.keys[0].group == obj.group )
        return true
      elsif(obj.is_a?(Valuefield) && !hash.keys[0].property.nil? && !obj.property.nil? && hash.keys[0].property == obj.property )
        return true
      end

    end

    return false
  end


  def all_seating_path_translator(php_args)


    for arg in php_args
      if(arg.include?(","))
        php_args += arg.split(",")
        php_args.delete(arg)
      end
    end

    path = []
    for part in Component.all + Product.all + Valuefield.all
      for code in php_args
        if(part.code == code)
          path.push(part)
        end
      end
    end


    partials = []
    while(!path.empty?)
      all_seating_build_partial_hash(path, path[0], partials)
    end

    return partials[0]

  end





  def all_seating_build_partial_hash(path,node,partials)

    hash = {node=>[]}
    partials.push(hash)
    path.delete(node)

    children = []
    if(node.is_a?(Category))
      children += ( node.products)
    elsif(node.is_a?(Product) || node.is_a?(Component))
      children += (node.components)
      children += (node.valuefields)
    else
      return []
    end

    for child in children
      for part in path
        if (part == child)
          hash[node].push(part)
          path.delete(part)
          break
        end
      end
      for part in partials
        if(part.keys[0] == child)
          hash[node].push(part)
          partials.delete(part)
        end
      end
    end

    return hash
  end





  #def all_seating_path_to_hash(path)
  #  path = path.split("|")
  #  hash = {}
  #
  #  for i in (0..(path.length-1))
  #    part = path[i]
  #    if(part[0] == "a")
  #      hash[Category.find(all_seating_id_of(part))] = []
  #
  #    elsif(part[0] == "p")
  #      prod = Product.find(all_seating_id_of(part))
  #      hash[prod] = []
  #
  #      categories = prod.categories
  #      for cat in categories
  #        if(hash.key?(cat))
  #          hash[cat].push(prod)
  #        end
  #
  #      end
  #
  #
  #    elsif(part[0] == "c")
  #      comp = Component.find(all_seating_id_of(part))
  #      hash[comp] = []
  #
  #      parents = comp.component_parents + comp.products
  #      for parent in parents
  #        if(hash.key?(parent))
  #          hash[parent].push(comp)
  #        end
  #      end
  #
  #
  #    elsif(part[0] == "v")
  #      val = Valuefield.find(all_seating_id_of(part))
  #
  #      parent = nil
  #
  #      if(val.product != nil)
  #        parent = val.product
  #      else
  #        parent = val.component
  #      end
  #
  #
  #      hash[parent].push(val)
  #    end
  #  end
  #
  #  return hash
  #
  #
  #end



  def all_seating_xml_from_hash(node, hash)

    xml = all_seating_to_xml_string(node)
    if(hash.key?(node))
      for child in hash[node]
        if(child.is_a?(Hash))
          index = xml.rindex("</#{child.keys[0].class.name}s>")
          xml.insert(index,all_seating_xml_from_hash(child.keys[0], child))
        else
          index = xml.rindex("</#{child.class.name}s>")
          xml.insert(index,all_seating_xml_from_hash(child, hash))
        end
      end

    end

    return xml


  end




  def all_seating_to_xml_string(element)

    if(element == nil)
      return
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
      xml += "<Products></Products>"
    elsif(element.is_a?(Product))
      xml += "<Components></Components>"
      xml += "<Valuefields></Valuefields>"
    elsif(element.is_a?(Component))
      xml += "<Components></Components>"
      xml += "<Valuefields></Valuefields>"
    end

    xml += "</#{element.class}>"

    return xml

  end


  def all_seating_texture(generic_xml_path, destination_path)

    file = File.new(generic_xml_path)
    doc = Document.new file
    all_seating_copy_textures(doc.root, destination_path)

  end

  def all_seating_copy_textures(elt, destination_path)
    if(!elt.is_a?(Element))
      return ""
    end

    if(!elt.elements["Image"].nil?)
      df = elt.elements["Image"]
      id = all_seating_get_child_text(df, "id")

      image = Image.find(id)
      source_path = "#{Rails.root}/public/#{"#{image.class}".tableize}/#{image.id}/original/original_#{image.picture_file_name}"

      all_seating_copy_file( source_path, destination_path + "/" + image.picture_file_name  )
    end

    for child in elt.children
      all_seating_copy_textures(child, destination_path)
    end

  end



  def all_seating_texture_xml(generic_xml_path, destination_path)

    file = File.new(generic_xml_path)
    doc = Document.new file

    xml =  "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<chair>\n<textures>"
    xml +=  all_seating_find_texture_elements(doc.root)
    xml +=  "\n</textures><exceptions>
<item type=\"standard\" name=\"Type82\" blendMode =\"MULTIPLY\" transparent=\"\">
		<image>
		<![CDATA[chairs/textures/Series82_0_19/Type82.png]]>

	</image>
	</item>
</exceptions>\n</chair>"

    all_seating_write_to_file(destination_path + "82_0_19.xml", xml)
  end


  def all_seating_dae(generic_xml_path, destination_path)
    file = File.new(generic_xml_path)
    doc = Document.new file
    result = all_seating_find_dae_element(doc.root)

    dae_source_path = "#{Rails.root}/public/#{"#{result.class}".tableize}/#{result.id}/#{result.filedata_file_name}"

    all_seating_copy_file(dae_source_path,"#{destination_path}/#{result.filedata_file_name}")


  end



  def all_seating_find_dae_element(elt)

    if(!elt.is_a?(Element))
      return nil
    end

    if(!elt.elements["Datafile"].nil?)
      df = elt.elements["Datafile"]
      id = all_seating_get_child_text(df, "id")

      return DataFile.find(id)              #actual dae data file
    end

    for child in elt.children
      return all_seating_find_texture_elements(child)
    end

    return result
  end



  def all_seating_find_texture_elements(elt)

    if(!elt.is_a?(Element))
      return ""
    end

    result = ""

    if(elt.name != "Valuefield" && !elt.elements["Image"].nil?)
      valuefield =  elt.elements["Valuefields"].elements["Valuefield"]
      type = all_seating_get_child_text(valuefield, "fieldvalue")                #name of component

      texture = all_seating_get_child_text(elt.elements["Image"], "picture_file_name")       #path to texture  TODO: might need to change to static path
      code = texture.split(".")[0]                #code_path

      result +=  "\n\t<item type=\"#{type}\" name=\"#{code}\">\n\t\t<![CDATA[#{texture}]]></item>\n"


    end



    for child in elt.children
      result += all_seating_find_texture_elements(child)
    end

    return result

  end


  def all_seating_get_child_text(elt, name)
    for child in elt.elements
      if child.name == name
        return child.text
      end
    end
  end

  def all_seating_id_of(part)
    return part[1..part.length]
  end

  def all_seating_write_to_file(path,text)

    File.open(path, 'w') {|f| f.write(text) }

  end


  def all_seating_copy_file(source_path, destination_path)

    #read
    image_source = File.open(source_path, "r")

    #write
    File.open(destination_path, 'wb') {|f| f.write(image_source.read) }
  end


end
