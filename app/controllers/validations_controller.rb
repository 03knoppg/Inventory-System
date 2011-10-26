class ValidationsController < ApplicationController
  # GET /validations
  # GET /validations.json
  #Function for index page
  def index
    #creates an array of all validations
    @validations = Validation.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @validations }
    end
  end

  # GET /validations/1
  # GET /validations/1.json
  #Function for show page
  def show
    #Finds selected validation
    @validation = Validation.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @validation }
    end
  end

  # GET /validations/new
  # GET /validations/new.json
  #Function for new page
  def new
    #create a new validation
    @validation = Validation.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @validation }
    end
  end

  # GET /validations/1/edit
  #Function for edit page
  def edit
    #Finds selected validation
    @validation = Validation.find(params[:id])
  end

  # POST /validations
  # POST /validations.json
  #Function to create validation
  def create
    #create validation to save
    @validation = Validation.new(params[:validation])
    #validation associated with kind
    @validation.kind = params[:kind]
    respond_to do |format|
      if @validation.save
        format.html { redirect_to @validation, notice: 'Validation was successfully created.' }
        format.json { render json: @validation, status: :created, location: @validation }
      else
        format.html { render action: "new" }
        format.json { render json: @validation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /validations/1
  # PUT /validations/1.json
  #Function to update validation
  def update
    #Finds selected validation
    @validation = Validation.find(params[:id])
    respond_to do |format|
      if @validation.update_attributes(params[:validation])
        format.html { redirect_to @validation, notice: 'Validation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @validation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /validations/1
  # DELETE /validations/1.json
  #Function to destroy validation
  def destroy
    #Finds selected validation
    @validation = Validation.find(params[:id])
    #destroys validation
    @validation.destroy
    respond_to do |format|
      format.html { redirect_to validations_url }
      format.json { head :ok }
    end
  end
end
