#Controller class for components
class ComponentsController < ApplicationController
  # GET /components
  # GET /components.json
  #Function for index page
  def index
    #creates & sorts an array of all components
    @all_components = Component.all.sort {|x,y| x.name <=> y.name }
    #creates an empty array
    @tmp_array = []
    #creates an empty hash
    @all_components_hash = {}
    #call to function to sort components array
    sort_components()
    respond_to do |format|
      format.html # mainmenu.html.erb
      format.json { render json: @all_components }
      format.xml { render :xml => @all_components }
    end
  end

  # GET /components/1
  # GET /components/1.json
  #Function to show components
  def show
    #Finds selected component
    @component = Component.find(params[:id])
    #Creates an array of all components
    @all_components =  Component.all
    #creats an array of all images
    @all_images = Image.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @component }
       format.xml { render :xml => @component }
    end
  end

  # GET /components/new
  # GET /components/new.json
  #Function for new components
  def new
    #Creates a sorted array of all products
    @all_products = Product.all.sort {|x,y| x.name <=> y.name }
    #Creates a sorted array of all groups
    @all_groups = Group.all.sort {|x,y| x.name <=> y.name }
    #creates a sorted array of all properties
    @all_properties = Property.all.sort {|x,y| x.name <=> y.name }
    #creates a sorted array of all components
    @all_components =  Component.all.sort {|x,y| x.name <=> y.name }

    #If statement to check if duplicating a record
    if params[:duplicate_component]
        #Assign component to be duplicated
        component_to_duplicate = Component.find params[:duplicate_component]
        #Assignment to use for select statements
        @component_use = component_to_duplicate
        #Duplicate the component to use -no id is carried over
        @component = component_to_duplicate.dup
        #creates an array of all the components parents
        @parent_cps = (component_to_duplicate.component_parents + component_to_duplicate.products).sort {|x,y| x.name <=> y.name }
    else
      #New Record
         @component = Component.new
         if(!params[:component_id].nil?)
            @parent_cps = [Component.find(params[:component_id])]
         elsif(!params[:product_id].nil?)
            @parent_cps = [Product.find(params[:product_id])]
         else
            @parent_cps = (@component.component_parents + @component.products).sort {|x,y| x.name <=> y.name }
         end
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @component }
    end
  end

  # GET /components/1/edit
  #Function to edit components
  def edit
    #Finds selected component
    @component = Component.find(params[:id])
    #Finds selected component - this variable is used due to requirements for duplicating records in the methods for the form page
    @component_use = Component.find(params[:id])
    #creates an array of all products
    @all_products = Product.all.sort {|x,y| x.name <=> y.name }
    #creates an array of all components
    @all_components =  Component.all.sort {|x,y| x.name <=> y.name }
    #creates an array of all components parents
    @associated_components = @component.component_parents.sort {|x,y| x.name <=> y.name }
    #creates an array of all components parents and associated products
    @parent_cps = (@component.component_parents + @component.products).sort {|x,y| x.name <=> y.name }
    #creates an array of all groups
    @all_groups = Group.all.sort {|x,y| x.name <=> y.name }
    #creates an array of all properties
    @all_properties = Property.all.sort {|x,y| x.name <=> y.name }
  end

  # POST /components
  # POST /components.json
  #Function to create components
  def create
    #Create component
    @component = Component.new(params[:component])

    if(params[:new_group_id] != nil)
      @component.group = Group.find(Integer(params[:new_group_id]))
    end

    if(params[:new_components_ids] != nil)
      for id in params[:new_components_ids]
        id = Integer(id)
         if(id < 0) #Component ids are set to negative values to differentiate from Product ids
           c = Component.find((id + 1) * -1)
           @component.component_parents.push(c)
         else
           p = Product.find(id)
           @component.products.push(p)
         end
      end
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
  #Function to update components
  def update
    #Find selected component
    @component = Component.find(params[:id])
    #sets @component.group to nil
    @component.group = nil

    if(!params[:new_group_id].nil?)
      @component.group = Group.find(Integer(params[:new_group_id]))
    end

    #Local variables
    #creates an array of component parents
    component_parents_val = @component.component_parents
    #creates an array of component products
    component_products_val = @component.products

    #Loop to remove parents
    for comp in component_parents_val
      comp.components.delete(@component)
    end
    #Loop to remove products
    for prod in component_products_val
      prod.components.delete(@component)
    end

    if(!params[:new_components_ids].nil?)
      for id in params[:new_components_ids]
         id = Integer(id)
         if(id < 0) #Component ids are set to negative values to differentiate from Product ids
           c = Component.find((id + 1) * -1)
           component_parents_val.push(c)
         else
           p = Product.find(id)
           component_products_val.push(p)
         end
      end
    end

    if(!@component.valuefields.nil?)
      @component.valuefields.clear
    end
    if(!params[:new_ValueFields].nil?)
      for id in params[:new_ValueFields]
        @component.valuefields.push(Valuefield.find(id))
      end
    end
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
    #Finds selected component
    @component = Component.find(params[:id])
    #creates an array of all components
    @all_components =  Component.all
    #creates an empty hash
    @all_components_hash = {}
    #call to function to destroy component
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
        #calls itself to destroy children
        destroy_component(child)
      end
    end
    #destroy component
    component.destroy
  end

   #Function to sort the components array
   def sort_components
    for com in @all_components
        @all_components_hash[com]= (com.components)
    end
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
