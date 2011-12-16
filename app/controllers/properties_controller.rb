class PropertiesController < ApplicationController
  # GET /properties
  # GET /properties.json
  #Function for index page
  def index
    @properties = Property.all
    #creates an array of all properties
    @all_properties = Property.all.sort {|x,y| x.name <=> y.name }
    #creates an empty string
    @sa = " "
    respond_to do |format|
      format.html # mainmenu.html.erb
      format.json { render json: @properties }
      format.xml { render :xml => @properties }
    end
  end

  # GET /properties/1
  # GET /properties/1.json
  #Function for show page
  def show
    #Finds selected property
    @property = Property.find(params[:id])
    #creates an array of associated valuefields
    @associated_values = @property.valuefields.sort {|x,y| x.fieldvalue <=> y.fieldvalue }
    respond_to do |format|
      format.html # show.html.erbml.erb
      format.json { render json: @property }
      format.xml { render :xml => @property }
    end
  end

  # GET /properties/new
  # GET /properties/new.json
  #Function for new page
  def new
    #create a property
    #if statement for duplicating a record
    if params[:duplicate_property]
        #Assign value to be duplicated
        value_to_duplicate = Property.find params[:duplicate_property]
        #set value to duplicated info minus id
        @property = value_to_duplicate.dup
    else
        #New category
        @property = Property.new

    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @property }
    end
  end

  # GET /properties/1/edit
  #Function for edit page
  def edit
    #Finds selected property
    @property = Property.find(params[:id])
  end

  # POST /properties
  # POST /properties.json
  #Function to create a property
  def create
    #create a property to save
    @property = Property.new(params[:property])
    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render json: @property, status: :created, location: @property }
      else
        format.html { render action: "new" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /properties/1
  # PUT /properties/1.json
  #Function to update property
  def update
    #Finds selected property
    @property = Property.find(params[:id])
    respond_to do |format|
      if @property.update_attributes(params[:property])
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  #Function to destroy property
  def destroy
    #Finds selected property
    @property = Property.find(params[:id])
    #destroys valuefields associated with properties
    for val in @property.valuefields
      val.destroy
    end
    #destroys property
    @property.destroy
    respond_to do |format|
      format.html { redirect_to '/admin' }
      format.json { head :ok }
    end
  end
end
