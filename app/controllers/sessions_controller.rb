class SessionsController < ApplicationController
     require "rexml/document"
  include REXML
  skip_before_filter :require_login, :except => [:destroy]

  def index
    redirect_to login_url
  end

  def new



    if(params[:TYPE] != nil)

      args = []
      args.push(params[:TYPE])
      args.push(params[:BACKTYPE])
      args.push(params[:CONTROL])
      args.push(params[:ARMS])
      args.push(params[:OPTIONS])
      args.push(params[:FABRIC])
      path = all_seating_path_translator(args)

      #hash = path_to_hash(path)


      xml = xml_from_hash(path.keys[0], path)
      write_to_file("/home/franz2/test/testFile.xml", xml)

      #get textures
      generate_a_s_texture_xml("/home/franz2/test/testFile.xml", "/home/franz2/test/")


      #get dae
      all_seating_dae("/home/franz2/test/testFile.xml", "/home/franz2/test/")

      #get models
      all_seating_texture("/home/franz2/test/testFile.xml", "/home/franz2/test/")

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





   def all_seating_path_translator(args)

      #{"TYPE"=>"82",
      #"BACKTYPE"=>"0",
      #"CONTROL"=>"19",
      #"ARMS"=>"NA",
      #"OPTIONS"=>"LP,FM-BMESH",
      #"FABRIC"=>"F4-PCABER"}

     for arg in args
       if(arg.include?(","))
        args += arg.split(",")
        args.delete(arg)
       end
     end

     path = []
     for part in Component.all + Product.all + Valuefield.all
       for code in args
         if(part.code == code)
           path.push(part)
         end
       end
     end


     partials = []
     while(!path.empty?)
       build_partial_hash(path, path[0], partials)
     end

    return partials[0]

   end





  def build_partial_hash(path,node,partials)

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


   def write_to_file(path,text)

    File.open(path, 'w') {|f| f.write(text) }


  end


  def path_to_hash(path)
    path = path.split("|")
    hash = {}

    for i in (0..(path.length-1))
      part = path[i]
      if(part[0] == "a")
         hash[Category.find(id_of(part))] = []

      elsif(part[0] == "p")
        prod = Product.find(id_of(part))
        hash[prod] = []

        categories = prod.categories
        for cat in categories
          if(hash.key?(cat))
            hash[cat].push(prod)
          end

        end


      elsif(part[0] == "c")
        comp = Component.find(id_of(part))
        hash[comp] = []

        parents = comp.component_parents + comp.products
        for parent in parents
          if(hash.key?(parent))
            hash[parent].push(comp)
          end
        end


      elsif(part[0] == "v")
        val = Valuefield.find(id_of(part))

        parent = nil

        if(val.product != nil)
          parent = val.product
        else
          parent = val.component
        end


        hash[parent].push(val)
      end
    end

    return hash



  end

  def xml_from_hash(node, hash)



    xml = xml(node)
    if(hash.key?(node))
      for child in hash[node]
        if(child.is_a?(Hash))
          index = xml.rindex("</#{child.keys[0].class.name}s>")
          xml.insert(index,xml_from_hash(child.keys[0], hash))
        else
          index = xml.rindex("</#{child.class.name}s>")
          xml.insert(index,xml_from_hash(child, hash))
        end
      end

    end

    return xml


  end


  def id_of(part)
    return part[1..part.length]
  end

  def xml(element)

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

    def basic_xml_from_path(path)


    s = "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<chair>
<textures>
   <item type=\"back\" name=\"BT0\">
       <![CDATA[chairs/textures/Series82_0_19/BT0.png]]>
   </item>
   <item type=\"back\" name=\"Type82\">
       <![CDATA[chairs/textures/Series82_0_19/Type82.png]]>
   </item>
   <item type=\"back\" name=\"Base82\">
       <![CDATA[chairs/textures/Series82_0_19/Base82.png]]>
   </item>
   <item type=\"back\" name=\"Casters\">
       <![CDATA[chairs/textures/Series82_0_19/Casters.png]]>
   </item>
   <item type=\"control\" name=\"C19\">
       <![CDATA[chairs/textures/Series82_0_19/C19.png]]>
   </item>
   <item type=\"control\" name=\"S8\">
       <![CDATA[chairs/textures/Series82_0_19/S8.png]]>
   </item>
   <item type=\"back\" name=\"MF\">
       <![CDATA[chairs/textures/Series82_0_19/MF.png]]>
   </item>
   <item type=\"back\" name=\"TW\">
       <![CDATA[chairs/textures/Series82_0_19/TW.png]]>
   </item>
   <item type=\"back\" name=\"T2\">
       <![CDATA[chairs/textures/Series82_0_19/T2.png]]>
   </item>
   <item type=\"back\" name=\"SS\">
       <![CDATA[chairs/textures/Series82_0_19/SS.png]]>
   </item>
   <item type=\"back\" name=\"FM-BMESH\">
       <![CDATA[chairs/textures/Series82_0_19/FM-BMESH.png]]>
   </item>
   <item type=\"option\" name=\"LP\">
       <![CDATA[chairs/textures/Series82_0_19/LP.png]]>
   </item>
   <item type=\"option\" name=\"shadow\">
       <![CDATA[chairs/textures/Series82_0_19/shadow.png]]>
   </item>
</textures>
<exceptions>
<item type=\"standard\" name=\"Type82\" blendMode =\"MULTIPLY\" transparent=\"\">
       <image>
       <![CDATA[chairs/textures/Series82_0_19/Type82.png]]>
   </image>
   </item>
</exceptions>
</chair>"

    File.open("/home/franz2/testFile.xml", 'w') {|f| f.write(s) }


    #f = File.new("testfile.xml", "r")
    #send_file(s, :type => "text/xml", :filename => "abc.xml")


    end


   def all_seating_texture(path, destination)

     file = File.new(path)
     doc = Document.new file
     copy_textures(doc.root, destination)

   end

   def copy_textures(elt, path)
     if(!elt.is_a?(Element))
       return ""
     end

     if(has_element(elt, "Image"))
       df = elt.elements["Image"]
       id = get_child(df, "id")

       data = Image.find(id)
       copy_image( data, path )             #actual data file
     end

     for child in elt.children
       copy_textures(child, path)
     end

   end

   def copy_image(image, path)

       #:path => ":rails_root/public/:class/:id/:style/:style_:basename.:extension",

    source_path = "#{Rails.root}/public/#{"#{image.class}".tableize}/#{image.id}/original/original_#{image.picture_file_name}"

    #read
    file = File.open(source_path, "r")
                  #  :path => ":rails_root/public/:class/:id/:basename.:extension",
                  #  :url => "/:class/:id/:basename.:extension"

    #write
    File.open("#{path}/#{image.picture_file_name}", 'wb') {|f| f.write(file.read) }
   end


  def generate_a_s_texture_xml(path, destination)

    file = File.new(path)
    doc = Document.new file
    all_seating_texture_xml = all_seating_textures(doc)
    write_to_file(destination + "all_seating_textures.xml", all_seating_texture_xml)
  end


  def all_seating_dae(xml_path, destination)
    file = File.new(xml_path)
    doc = Document.new file
    result = find_dae_element(doc.root)

    dae_source_path = "#{Rails.root}/public/#{"#{result.class}".tableize}/#{result.id}/#{result.filedata_file_name}"

    #read
    file = File.open(dae_source_path, "r")
                  #  :path => ":rails_root/public/:class/:id/:basename.:extension",
                  #  :url => "/:class/:id/:basename.:extension"

    #write
    File.open("#{destination}/#{result.filedata_file_name}", 'wb') {|f| f.write(file.read) }
   # File.open(path, "wb") { |f| f.write(upload['datafile'].read) }


    #write_to_file(destination + result.filedata_file_name, result)
  end



  def find_dae_element(elt)

    if(!elt.is_a?(Element))
      return ""
    end

    if(has_element(elt, "Datafile"))
      df = elt.elements["Datafile"]
      id = get_child(df, "id")

      data = DataFile.find(id)
      return data              #actual data file
    end

    for child in elt.children
       return find_texture_elements(child)
    end

    return result
  end



  def all_seating_textures(doc)


    xml = Document.new
    xml << XMLDecl.default

    chair = Element.new "chair", xml.root
    textures = Element.new "textures", chair

    result =  "<?xml version=\"1.0\" encoding=\"utf-8\"?><chair><textures>"

    result +=  find_texture_elements(doc.root)

    result +=  "</textures></chair>"

    return result
  end

  def find_texture_elements(elt)

    if(!elt.is_a?(Element))
      return ""
    end

    result = ""

     if(has_element(elt, "model_path"))
      name = get_child(elt, "name")                #name of component
      type = get_child(elt, "code")                #code_path
      texture = get_child(elt, "model_path")       #path to texture  TODO: might need to change to static path

      result +=  "<item type=\"#{type}\" name=\"#{name}\"><![CDATA[#{texture}]]></item>"


     end



    for child in elt.children
       result += find_texture_elements(child)
    end

    return result

  end

  def has_element(elt, type)
     for child in elt.elements
       if(child.name == type)
         return true
       end
     end
    return false
  end

  def get_child(elt, name)
    for child in elt.elements
      if child.name == name
        return child.text
      end
    end
  end


end
