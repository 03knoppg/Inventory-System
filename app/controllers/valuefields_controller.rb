class ValuefieldsController < ApplicationController
  # GET /valuefields
  # GET /valuefields.json
  def index
    @valuefields = Valuefield.all
    @all_attributes = Attribute.all

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
    @all_attributes = Attribute.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @valuefield }
    end
  end

  # GET /valuefields/1/edit
  def edit
    @valuefield = Valuefield.find(params[:id])
    @all_attributes = Attribute.all
  end

  # POST /valuefields
  # POST /valuefields.json
  def create
    @valuefield = Valuefield.new(params[:valuefield])
    @all_attributes = Attribute.all

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

    respond_to do |format|
      format.html { redirect_to valuefields_url }
      format.json { head :ok }
    end
  end
end
