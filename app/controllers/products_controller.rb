class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @all_products =  Product.all
    @sp = ""

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
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
