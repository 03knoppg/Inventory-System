class ProductsController < ApplicationController
  require "gnerator"

  # GET /products
  # GET /products.json
  #Function for index page
  def index
    #creates an array of all products
    @all_products =  Product.all.sort {|x,y| x.name <=> y.name }
    #creates an array of all images
    @all_images = Image.all.sort {|x,y| x.picture_file_name <=> y.picture_file_name }
    #creates an empty string
    @sp = ""
    respond_to do |format|
      format.html # mainmenu.html.erb
      format.json { render json: @products }
      #format.xml { render :xml => @products }
      format.xml {  }
    end
  end

  # GET /products/1
  # GET /products/1.json
  #Function for show page
  def show
    #Finds selected product
    @product = Product.find(params[:id])
    #creates an array of all images
    @all_images = Image.all.sort {|x,y| x.picture_file_name <=> y.picture_file_name }
    #creates an array of all data files
    @all_datafiles = DataFile.all.sort {|x,y| x.filedata_file_name <=> y.filedata_file_name }
    #creates a sorted array using all categories
    @all_categories =  Category.all.sort {|x,y| x.name <=> y.name }
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
      format.xml { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  #Function for new page
  def new
    #creates an array of all categories
    @all_categories = Category.all.sort {|x,y| x.name <=> y.name }
    #creates an empty array
    @associated_categories = []

    #if statement for duplicating a record
    if params[:duplicate_product]
        #Assign product to be duplicated
        product_to_duplicate = Product.find params[:duplicate_product]
        #set category to duplicated info minus id
        @product = product_to_duplicate.dup
        #Use for select fields
        @associated_categories = product_to_duplicate.categories
    else
        #New category
        @product = Product.new
        if(!params[:category_id].nil?)
          @associated_categories = [Category.find(params[:category_id])]
        end
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  #Function for edit page
  def edit
    #Finds selected product
    @product = Product.find(params[:id])
    #creates an array of all the products associated categories
    @associated_categories = @product.categories.sort {|x,y| x.name <=> y.name }
    #creates an array of all categories
    @all_categories = Category.all.sort {|x,y| x.name <=> y.name }
  end

  # POST /products
  # POST /products.json
  #Function to create products
  def create
    #create a new product
    @product = Product.new(params[:product])
    #creates an array of all categories
    @all_categories = Category.all.sort {|x,y| x.name <=> y.name }
    #creates an empty array
    @associated_categories = []

    if(!params[:category_id].nil?)
      @associated_categories = [Category.find(params[:category_id])]
    end

    if(!params[:new_categories_ids].nil?)
      @product.categories = Category.find(params[:new_categories_ids])
    else
      @product.categories = []
    end
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
    #update product
    @product = Product.find(params[:id])

    if(!params[:new_categories_ids].nil?)
      @product.categories = Category.find(params[:new_categories_ids])
    end
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
    #Finds selected product
    @product = Product.find(params[:id])
    #destroy product
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
  end

end
