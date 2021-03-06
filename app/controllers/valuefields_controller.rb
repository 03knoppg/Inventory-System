class ValuefieldsController < ApplicationController
  # GET /valuefields
  # GET /valuefields.json
  #Function for index page
  def index
    #creates an array of all properties
    @all_properties = Property.all.sort!{|x,y| x.name <=> y.name}
    #creates an array of all components
    @all_components = Component.all.sort!{|x,y| x.name <=> y.name}
    #creates an array of all products
    @all_products = Product.all.sort!{|x,y| x.name <=> y.name}
    #creates an array of all valuefields
    @all_valuefields = Valuefield.all.sort!{|x,y| x.fieldvalue <=> y.fieldvalue}
    respond_to do |format|
      format.html # mainmenu.html.erb
      format.json { render json: @valuefields }
       format.xml { render :xml => @valuefields }
    end
  end

  # GET /valuefields/1
  # GET /valuefields/1.json
  #Function for show page
  def show
    #Finds selected valuefield
    @valuefield = Valuefield.find(params[:id])
    #creates an array of all images
    @all_images = Image.all.sort!{|x,y| x.picture_file_name <=> y.picture_file_name}
    @all_properties = Property.all
    @all_products = Product.all
    @all_components = Component.all

    if(!@valuefield.property_id.nil?)
      @property = Property.find(@valuefield.property_id)
    else
      @property = nil
    end

    respond_to do |format|
      format.html # show.html.erbml.erb
      format.json { render json: @valuefield }
      format.xml { render :xml => @valuefield }
      format.js
    end
  end

  # GET /valuefields/new
  # GET /valuefields/new.json
  #Function for new page
  def new
    @all_properties = Property.all.sort!{|x,y| x.name <=> y.name}
    @all_prods_comps = (Product.all + Component.all).sort!{|x,y| x.name <=> y.name}
    @all_products = Product.all
    @components = []
    @products = []
    @all_products = Product.all
    @all_components = Component.all

    #if statement for duplicating a record
    if params[:duplicate_valuefield]
        #Assign value to be duplicated
        value_to_duplicate = Valuefield.find params[:duplicate_valuefield]
        #set value to duplicated info minus id
        @valuefield = value_to_duplicate.dup
        #Global Variables for duplicate
        @property = value_to_duplicate.property
        @items_to_select = value_to_duplicate.components + value_to_duplicate.products
    else
        #New category
        @valuefield = Valuefield.new
         if(!params[:property_id].nil?)
          @property = Property.find(params[:property_id])
         end
          if(!params[:component_id].nil?)
            @items_to_select = [Component.find(params[:component_id])]
          end

          if(!params[:product_id].nil?)
            @items_to_select = [Product.find(params[:product_id])]
          end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @valuefield }
    end
  end

  # GET /valuefields/1/edit
  def edit
    @valuefield = Valuefield.find(params[:id])
    @all_properties = Property.all.sort!{|x,y| x.name <=> y.name}
    @all_prods_comps = (Product.all + Component.all).sort!{|x,y| x.name <=> y.name}

    @property = @valuefield.property
    @items_to_select = @valuefield.components + @valuefield.products
    @path = @valuefield.path

  end

  # POST /valuefields
  # POST /valuefields.json
  def create
    @valuefield = Valuefield.new(params[:valuefield])

    path = params[:valuefield_path_hidden]

    if(!params[:prod_comp_id].nil? && !params[:prod_comp_id].empty?)
      prod_comp = []
      for ids in params[:prod_comp_id]
         prod_comp.push(Integer(ids))
      end
    end

     if(!params[:product_ids].nil?)
       for prod in params[:product_ids]
        @valuefield.products.push(Product.find(prod))
       end
     end

     if(!params[:component_parent_ids].nil?)
       for comp in params[:component_parent_ids]
          @valuefield.components.push(Component.find(comp))
       end
     end

    if(!params[:property_id].nil?)
      property =  Property.find(Integer(params[:property_id]))
      @valuefield.property = property
    end

    if(!path.nil?)
      @valuefield.path = path

    elsif(!prod_comp.nil?)
      for pc in prod_comp
      if(pc < 0)   #Product id is negative to differentiate from component
        product =  Product.find(-(pc+1))
        @valuefield.products.push(product)
        product.properties.push(property)
      else
        component = Component.find(pc)
        @valuefield.components.push(component)
        component.properties.push(property)
      end
      end
    end

    respond_to do |format|
      if @valuefield.save
        format.html { redirect_to session[:rq], notice: 'Valuefield was successfully created.' }
        format.json { render json: @valuefield, status: :created, location: @valuefield }
      else
        format.html { render action: "new" }
        format.json { render json: @valuefield.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /valuefields/1
  # PUT /valuefields/1.json
  def update
    @valuefield = Valuefield.find(params[:id])

    #Components
    #Checks if the valuefield is attached to any components - if so clears them
    if(!@valuefield.components.nil?)
      @valuefield.components.clear
    end
    #Sets Data Files Components
    if(!params[:component_parent_ids].nil?)
      for id in params[:component_parent_ids]
        @valuefield.components.push(Component.find(id))
      end
    end

    #Products
    #Checks if the valuefield is attached to any products - if so clears them
    if(!@valuefield.products.nil?)
      @valuefield.products.clear
    end
    #Sets Data Files Products
    if(!params[:product_ids].nil?)
      for id in params[:product_ids]
        @valuefield.products.push(Product.find(id))
      end
    end

    #Property
    #Sets valuefield property id
    if(!params[:property_ids].nil?)
      for id in params[:property_ids]
        @valuefield.property_id = id
      end
    end

    if(!params[:prod_comp_id].nil?)
      prod_comp_id = Integer(params[:prod_comp_id])
      @valuefield.product = nil
      @valuefield.component = nil
    else
      prod_comp_id = nil
    end

    #logger.info("\n\nPROD_COMP: " + prod_comp.inspect + " \n\n\n")
    if(!prod_comp_id.nil?)
      if(prod_comp_id < 0)       #Product id is negative to differentiate from component
        @valuefield.product = Product.find(-(prod_comp_id+1))
        product = Product.find(-(prod_comp_id+1))
         property =  Property.find(Integer(params[:property_id][0]))
        @valuefield.property = property
        product.properties.push(property)
      elsif
        @valuefield.component = Component.find(prod_comp_id)
        property =  Property.find(Integer(params[:property_id][0]))
        component = Component.find(prod_comp_id)
        @valuefield.property = property
        component.properties.push(property)
      end
    end

    if(!params[:property_id].nil?)
      @valuefield.property = Property.find(Integer(params[:property_id][0]))
    end

    respond_to do |format|
      if @valuefield.update_attributes(params[:valuefield])
        format.html { redirect_to @valuefield, notice: 'Valuefield was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @valuefield.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valuefields/1
  # DELETE /valuefields/1.json
  def destroy
    @valuefield = Valuefield.find(params[:id])
    @valuefield.destroy

    respond_to do |format|
      format.html { redirect_to '/admin' }
      format.json { head :ok }
    end
  end
end
