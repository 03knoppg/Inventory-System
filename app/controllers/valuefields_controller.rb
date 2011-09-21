class ValuefieldsController < ApplicationController
  # GET /valuefields
  # GET /valuefields.json
  def index
    @valuefields = Valuefield.all
    @all_properties = Property.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @valuefields }
    end
  end

  # GET /valuefields/1
  # GET /valuefields/1.json
  def show
    @valuefield = Valuefield.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @valuefield }
    end
  end

  # GET /valuefields/new
  # GET /valuefields/new.json
  def new
    @valuefield = Valuefield.new
    @all_properties = Property.all

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
    #@all_properties = Property.all

    prod_comp = Integer(params[:prod_comp_id][0])

    logger.info("\n\nPROD_COMP: " + prod_comp.inspect + " \n\n\n")
    if(prod_comp < 0)       #Product id is negative to differentiate from component
      @valuefield.product = Product.find(-(prod_comp+1))
    elsif
      @valuefield.component = Component.find(prod_comp)
    else
      logger.info("\n\nTYPE: " + prod_comp.class.inspect + " \n\n\n")
    end

    @valuefield.property = Property.find(Integer(params[:property_id][0]))

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

    prod_comp = Integer(params[:prod_comp_id][0])
    @valuefield.product = nil
    @valuefield.component = nil

    logger.info("\n\nPROD_COMP: " + prod_comp.inspect + " \n\n\n")
    if(prod_comp < 0)       #Product id is negative to differentiate from component
      @valuefield.product = Product.find(-(prod_comp+1))
    elsif
      @valuefield.component = Component.find(prod_comp)
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
