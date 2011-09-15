class ValueFieldsController < ApplicationController
  # GET /value_fields
  # GET /value_fields.json
  def index
    @value_fields = ValueField.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @value_fields }
    end
  end

  # GET /value_fields/1
  # GET /value_fields/1.json
  def show
    @value_field = ValueField.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @value_field }
    end
  end

  # GET /value_fields/new
  # GET /value_fields/new.json
  def new
    @value_field = ValueField.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @value_field }
    end
  end

  # GET /value_fields/1/edit
  def edit
    @value_field = ValueField.find(params[:id])
  end

  # POST /value_fields
  # POST /value_fields.json
  def create
    @value_field = ValueField.new(params[:value_field])

    respond_to do |format|
      if @value_field.save
        format.html { redirect_to @value_field, notice: 'Value field was successfully created.' }
        format.json { render json: @value_field, status: :created, location: @value_field }
      else
        format.html { render action: "new" }
        format.json { render json: @value_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /value_fields/1
  # PUT /value_fields/1.json
  def update
    @value_field = ValueField.find(params[:id])

    respond_to do |format|
      if @value_field.update_attributes(params[:value_field])
        format.html { redirect_to @value_field, notice: 'Value field was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @value_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /value_fields/1
  # DELETE /value_fields/1.json
  def destroy
    @value_field = ValueField.find(params[:id])
    @value_field.destroy

    respond_to do |format|
      format.html { redirect_to value_fields_url }
      format.json { head :ok }
    end
  end
end
