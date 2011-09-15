class ComponentsController < ApplicationController
  # GET /components
  # GET /components.json
  def index
    @components = Component.all
    @tmp_array = []
    @all_components =  Component.all
    @all_components_hash = {}
    @sc = ""

    sort_components()

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @components }
    end
  end

  # GET /components/1
  # GET /components/1.json
  def show
    @component = Component.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @component }
    end
  end

  # GET /components/new
  # GET /components/new.json
  def new
    @component = Component.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @component }
    end
  end

  # GET /components/1/edit
  def edit
    @component = Component.find(params[:id])
    @all_components =  Component.all
  end

  # POST /components
  # POST /components.json
  def create
    @component = Component.new(params[:component])

    respond_to do |format|
      if @component.save
        format.html { redirect_to @component, notice: 'Component was successfully created.' }
        format.json { render json: @component, status: :created, location: @component }
      else
        format.html { render action: "new" }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /components/1
  # PUT /components/1.json
  def update
    @component = Component.find(params[:id])

    respond_to do |format|
      if @component.update_attributes(params[:component])
        format.html { redirect_to @component, notice: 'Component was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.json
  def destroy
    @component = Component.find(params[:id])
    @component.destroy

    respond_to do |format|
      format.html { redirect_to components_url }
      format.json { head :ok }
    end
  end

   #Function to sort the components array
   def sort_components
    logger.info("+++++++++++++++++++++++++++ Sort_category begin #{@all_components}")

    for com in @all_components


      if(com.parent_id == nil)
         @all_components_hash[0] = [com]

      else

        if(@all_components_hash[com.parent_id] == nil)
          @all_components_hash[com.parent_id] = []
        end

        @all_components_hash[com.parent_id].push(com)
      end
    end

    for key in @all_components_hash.keys
      @all_components_hash[key].sort!{|x,y| x.name <=> y.name}
    end
  end
end
