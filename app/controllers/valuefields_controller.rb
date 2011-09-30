class ValuefieldsController < ApplicationController
  # GET /valuefields
  # GET /valuefields.json
  def index
    @valuefields = Valuefield.all
    @all_properties = Property.all
    @all_valuefields = Valuefield.all

    respond_to do |format|
      format.html # mainmenu.html.erb
      format.json { render json: @valuefields }
       format.xml { render :xml => @valuefields }
    end
  end

  # GET /valuefields/1
  # GET /valuefields/1.json
  def show
    @valuefield = Valuefield.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @valuefield }
      format.xml { render :xml => @valuefield }
    end
  end

  # GET /valuefields/new
  # GET /valuefields/new.json
  def new
    @valuefield = Valuefield.new
    @all_properties = Property.all
    @paths = ""
    @all_prods_comps = Product.all + Component.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @valuefield }
    end
  end

  # GET /valuefields/1/edit
  def edit
    @valuefield = Valuefield.find(params[:id])
    @all_properties = Property.all
    @all_prods_comps = Product.all + Component.all
  end

  # POST /valuefields
  # POST /valuefields.json
  def create
    @valuefield = Valuefield.new(params[:valuefield])

    logger.info("\n\n\n PATH#{params.inspect}")

    path = params[:path]
    if(!params[:prod_comp_id] == nil)
      prod_comp = Integer(params[:prod_comp_id])
    end

    property =  Property.find(Integer(params[:property_id]))
    @valuefield.property = property

    if(path == nil)

      #logger.info("\n\nPROD_COMP: " + prod_comp.inspect + " \n\n\n")
      if(prod_comp < 0)       #Product id is negative to differentiate from component
        product =  Product.find(-(prod_comp+1))
        @valuefield.product = product
        product.properties.push(property)
      elsif
        component =   Component.find(prod_comp)
        @valuefield.component = component
        component.properties.push(property)
      else
        logger.info("\n\nTYPE: " + prod_comp.class.inspect + " \n\n\n")
      end
    else
      @valuefield.path = path
    end



    respond_to do |format|
      if @valuefield.save
        format.html { redirect_to @valuefield, notice: 'Valuefield was successfully created.' }
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

    prod_comp = Integer(params[:prod_comp_id])
    @valuefield.product = nil
    @valuefield.component = nil

    logger.info("\n\nPROD_COMP: " + prod_comp.inspect + " \n\n\n")
    if(prod_comp < 0)       #Product id is negative to differentiate from component
      @valuefield.product = Product.find(-(prod_comp+1))
      product = Product.find(-(prod_comp+1))
       property =  Property.find(Integer(params[:property_id][0]))
      @valuefield.property = property
      product.properties.push(property)
    elsif
      @valuefield.component = Component.find(prod_comp)
      property =  Property.find(Integer(params[:property_id][0]))
      component = Component.find(prod_comp)
      @valuefield.property = property
      component.properties.push(property)
    else
      logger.info("\n\nTYPE: " + prod_comp.class.inspect + " \n\n\n")
    end

    @valuefield.property = Property.find(Integer(params[:property_id][0]))

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
    logger.info("YES IT DID")

    respond_to do |format|
      format.html { redirect_to valuefields_url }
      format.json { head :ok }
    end
  end
end
