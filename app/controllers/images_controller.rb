class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  #Function for index page
  def index
    #creates an array of all images
    @all_images = Image.all.sort!{|x,y| x.picture_file_name <=> y.picture_file_name}
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  #Function for show page
  def show
    #Finds selected image
    @image = Image.find(params[:id])
    @all_products = Product.all
    @all_properties = Property.all

    respond_to do |format|
      format.html # show.html.erbml.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  #Function for new page
  def new
    #create a new image
    @image = Image.new
     #creates an array of all products
    @all_products = Product.all
    #creates an array of all components
    @all_components = Component.all
    #creates an array of all valuefields
    @all_valuefields = Valuefield.all
    @all_properties = Property.all

    if params[:duplicate_image]
       #Assign value to be duplicated
       value_to_duplicate = Image.find(params[:duplicate_image])
       #set value to duplicated info minus id
       @item = value_to_duplicate.dup
       @items_to_select = value_to_duplicate.components + value_to_duplicate.products + value_to_duplicate.valuefields
    else

      if(!params[:product_id].nil?)
        @items_to_select = Product.find(params[:product_id])
      end

      if(!params[:component_id].nil?)
        @items_to_select = Component.find(params[:component_id])
      end

       if(!params[:valuefield_id].nil?)
        @items_to_select = Valuefield.find(params[:valuefield_id])
       end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  #Function for edit page
  def edit
    #Finds selected image
    @image = Image.find(params[:id])
    #creates an array of all products
    @all_products = Product.all
    #creates an array of all components
    @all_components = Component.all
    #creates an array of all valuefields
    @all_valuefields = Valuefield.all
    #assigns variable associated product

    @items_to_select = @image.products +  @image.components + @image.valuefields

  end

  # POST /images
  # POST /images.json
  #Function to create image
  def create
    #create an image to save
    @image = Image.new(params[:image])
    #creates an array of all products
    @all_products = Product.all
    #creates an array of all components
    @all_components = Component.all
    #creates an array of all valuefields
    @all_valuefields = Valuefield.all

    if(!params[:new_products_ids].nil?)
      @image.products = Product.find(params[:new_products_ids])
    end

    if(!params[:new_components_ids].nil?)
      @image.components = Component.find(params[:new_components_ids])
    end

    if(!params[:new_valuefields_ids].nil?)
      @image.valuefields = Valuefield.find(params[:new_valuefields_ids])
    end

    @items_to_select = @image.products +  @image.components + @image.valuefields

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
  #Function to update image
  def update
    #Finds selected image
    @image = Image.find(params[:id])
    #creates an array of products
    @all_products = Product.all
    #creates an array of components
    @all_components = Component.all
    #creates an array of valuefields
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
  #Function to delete image
  def destroy
    #Finds selected image
    @image = Image.find(params[:id])
    #destroy image
    @image.destroy
    respond_to do |format|
      format.html { redirect_to '/admin' }
      format.json { head :ok }
    end
  end
end
