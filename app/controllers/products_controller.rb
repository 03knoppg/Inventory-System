class ProductsController < ApplicationController

  before_filter :require_login


  require "gnerator"



  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @all_products =  Product.all
    @sp = ""

    #Generator.xml_from_path("")

    path = "a4|p2|c10|v2|c14|c11|v9|c1|c9"
    hash = path_to_hash(path)
    xml = xml_from_hash(hash.keys[0], hash)
    write_to_file(xml)

    respond_to do |format|
      format.html # mainmenu.html.erb
      format.json { render json: @products }
      #format.xml { render :xml => @products }
      format.xml {  }
    end
  end

  # GET /products/1
  # GET /products/1.json
  #Function to show products
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
      format.xml { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    @all_categories = Category.all
    @associated_categories = @product.categories

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  #Function to edit products
  def edit
    @product = Product.find(params[:id])
    @associated_categories = @product.categories
    @all_categories = Category.all
  end

  # POST /products
  # POST /products.json
  #Function to create products
  def create
    @product = Product.new(params[:product])

    categories = Category.find(params[:new_categories_ids])

    @product.categories = categories

    #logger.info("+++++++++++++++++++++++++++found categories #{@product.categories}")

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  #Function to update products
  def update
    @product = Product.find(params[:id])
    categories = Category.find(params[:new_categories_ids])
    @product.categories = categories
    respond_to do |format|
      if @product.update_attributes(params[:product])

        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  #Function to destroy products
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
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

  def write_to_file(text)

    File.open("/home/franz2/testFile.xml", 'w') {|f| f.write(text) }



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




    if(node.is_a?(Category))
      #xml = render_to_string(category_path,:action=>"show", :id=>node.id)
      xml = render_to_string(xml: category_path, :id=>node.id)
      index = xml.rindex("</")
      for child in hash[node]
        xml.insert(index,xml_from_hash(child, hash))
      end
      xml += "</Category>\n"

    elsif(node.is_a?(Product))
      xml = render_to_string(:action => "/products/#{node.id}", :layout => false)
      index = xml.rindex("</")
      for child in hash[node]
        xml.insert(index,xml_from_hash(child, hash))
      end
      xml += "</Product>\n"

    elsif(node.is_a?(Component))
      xml = render_to_string(:action => "/components/#{node.id}", :layout => false)
      index = xml.rindex("</")
      index = xml.rindex("</")
      for child in hash[node]
        xml.insert(index,xml_from_hash(child, hash))
      end
      xml = "</Component>\n"

    elsif(node.is_a?(Valuefield))
      xml = render_to_string(:action => "/valuefields/#{node.id}", :layout => false)

    end

    return xml


  end


  


  def id_of(part)
    return part[1..part.length]
  end


end
