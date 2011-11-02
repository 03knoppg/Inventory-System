class DataFilesController < ApplicationController
  # GET /data_files
  # GET /data_files.json
  #Function for index page
  def index
    #creates an array of all Data Files
    @data_files = DataFile.all
    #creates an empty string
    @df = ""
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data_files }
    end
  end

  # GET /data_files/1
  # GET /data_files/1.json
  #Function for show page
  def show
    #Finds selected data file
    @data_file = DataFile.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @data_file }
    end
  end

  # GET /data_files/new
  # GET /data_files/new.json
  #Function for new page
  def new
    #creates a new data file
    @data_file = DataFile.new
    #creates an array for all components
    @all_components = Component.all
    #creates an array for all products
    @all_products = Product.all
    #creates an array for all valuefields
    @all_valuefields = Valuefield.all

    if(!params[:product_id].nil?)
      @items_to_select = Product.find(params[:product_id])
    end

    if(!params[:component_id].nil?)
      @items_to_select = Component.find(params[:component_id])
    end

    if(!params[:valuefield_id].nil?)
      @items_to_select = Valuefield.find(params[:valuefield_id])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @data_file }
    end
  end

  # GET /data_files/1/edit
  #Function for edit page
  def edit
    #Finds selected datafile
    @data_file = DataFile.find(params[:id])
    #creates an array of all products
    @all_products = Product.all
    #creates an array of all components
    @all_components = Component.all
    #creates an array of all valuefields
    @all_valuefields = Valuefield.all

    @items_to_select = @data_file.products + @data_file.components + @data_file.valuefields
  end

  # POST /data_files
  # POST /data_files.json
  #Function to create a new data file
  def create
    #Creates a new data file to be saved
    @data_file = DataFile.new(params[:data_file])
    #creates an array of all components
    @all_components = Component.all
    #creates an array of all products
    @all_products = Product.all
    #creates an array of all valuefields
    @all_valuefields = Valuefield.all
    respond_to do |format|
      if @data_file.save
        format.html { redirect_to @data_file, notice: 'Data file was successfully created.' }
        format.json { render json: @data_file, status: :created, location: @data_file }
      else
        format.html { render action: "new" }
        format.json { render json: @data_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /data_files/1
  # PUT /data_files/1.json
  #Function to update a data file
  def update
    #Finds selected data file
    @data_file = DataFile.find(params[:id])
    respond_to do |format|
      if @data_file.update_attributes(params[:data_file])
        format.html { redirect_to @data_file, notice: 'Data file was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @data_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_files/1
  # DELETE /data_files/1.json
  #Function to destroy a data file
  def destroy
    #Finds selected data file
    @data_file = DataFile.find(params[:id])
    #destroys data file
    @data_file.destroy
    respond_to do |format|
      format.html { redirect_to data_files_url }
      format.json { head :ok }
    end
  end
end
