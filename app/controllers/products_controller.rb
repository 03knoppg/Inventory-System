class ProductsController < ApplicationController



  require "gnerator"



  # GET /products
  # GET /products.json
  def index
    @all_products =  Product.all.sort {|x,y| x.name <=> y.name }
    @all_images = Image.all.sort {|x,y| x.picture_file_name <=> y.picture_file_name }

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
  #Function to show products
  def show
    @product = Product.find(params[:id])
    @all_images = Image.all.sort {|x,y| x.picture_file_name <=> y.picture_file_name }
    @all_datafiles = DataFile.all.sort {|x,y| x.filedata_file_name <=> y.filedata_file_name }

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
    @all_categories = Category.all.sort {|x,y| x.name <=> y.name }
    @associated_categories = []

    if(!params[:category_id].nil?)
      @associated_categories = [Category.find(params[:category_id])]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  #Function to edit products
  def edit
    @product = Product.find(params[:id])
    @associated_categories = @product.categories.sort {|x,y| x.name <=> y.name }
    @all_categories = Category.all.sort {|x,y| x.name <=> y.name }
  end

  # POST /products
  # POST /products.json
  #Function to create products
  def create
    @product = Product.new(params[:product])

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
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
  end

end
