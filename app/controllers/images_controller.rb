class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @all_images = Image.all.sort!{|x,y| x.picture_file_name <=> y.picture_file_name}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = Image.new
    @all_components = Component.all
    @all_products = Product.all
    @all_valuefields = Valuefield.all

    if(!params[:product_id].nil?)
      @product = Product.find(params[:product_id])
    end

    if(!params[:component_id].nil?)
      @component = Component.find(params[:component_id])
    end

     if(!params[:valuefield_id].nil?)
      @valuefield = Valuefield.find(params[:valuefield_id])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
    @all_products = Product.all
    @all_components = Component.all
    @all_valuefields = Valuefield.all

    @product = @image.product
    @component = @image.component

  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(params[:image])
    @all_products = Product.all
    @all_components = Component.all
    @all_valuefields = Valuefield.all

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])
    @all_products = Product.all
    @all_components = Component.all
    @all_valuefields = Valuefield.all

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :ok }
    end
  end
end
