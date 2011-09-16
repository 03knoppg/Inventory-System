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
    @all_components =  Component.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @component }
    end
  end

  # GET /components/new
  # GET /components/new.json
  def new
    @component = Component.new
    @all_components = Component.all
    @associated_components = []
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @component }
    end
  end

  # GET /components/1/edit
  def edit
    @component = Component.find(params[:id])
    @all_components =  Component.all
    @associated_components = @component.component_parents
  end

  # POST /components
  # POST /components.json
  def create
    @component = Component.new(params[:component])

    components = Component.find(params[:new_components_ids])
    for comp in components
       comp.components.push(@component)
    end

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
   #Function to destroy a component
  def destroy
    @component = Component.find(params[:id])
    @all_components =  Component.all
    @all_components_hash = {}
    destroy_component(@component)


    respond_to do |format|
      format.html { redirect_to components_url }
      format.json { head :ok }
    end
  end

  #Function to destroy a parent component and its children
  def destroy_component(component)
    if(component == nil || component.id == nil)
        return
    end

      for child in component.components
        if(child.component_parents.length < 2)
          destroy_component(child)
        end
      end
    component.destroy
  end

   #Function to sort the components array
   def sort_components
    @all_components_copy = []
    for com in @all_components

        @all_components_hash[com]= (com.components)

        for all_com_copy in com.components
          @all_components_copy.push(all_com_copy)
        end
    end
    @all_components_copy = @all_components - @all_components_copy

    for key in @all_components_hash.keys
      @all_components_hash[key].sort!{|x,y| x.name <=> y.name}
    end
   end

   #Function to sort the categories array
   def sort_components_for_delete

    for comp in @all_components
      if(comp == nil)
         @all_components_hash[0] = [comp]
      else
        if(@all_components_hash[comp.parent_id] == nil)
          @all_components_hash[comp.parent_id] = []
        end

        @all_components_hash[comp.parent_id].push(comp)
      end
    end

    for key in @all_components_hash.keys
      @all_components_hash[key].sort!{|x,y| x.name <=> y.name}
    end
  end
end
