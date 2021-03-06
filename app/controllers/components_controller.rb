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
    #Creates a sorted array of all products
    @all_products = Product.all.sort {|x,y| x.name <=> y.name }
    #Creates a sorted array of all groups
    @all_groups = Group.all.sort {|x,y| x.name <=> y.name }
    #creates a sorted array of all properties
    @all_properties = Property.all.sort {|x,y| x.name <=> y.name }
    respond_to do |format|
      format.html # popup_showp_show.html.erb
      format.json { render json: @component }
       format.xml { render :xml => @component }
      format.js
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
        @items_to_select = (component_to_duplicate.component_parents + component_to_duplicate.products + [component_to_duplicate.group] + component_to_duplicate.valuefields)
    else
      #New Record
         @component = Component.new
         if(!params[:component_id].nil?)
            @items_to_select = [Component.find(params[:component_id])]
         elsif(!params[:product_id].nil?)
            @items_to_select = [Product.find(params[:product_id])]
         else
            @items_to_select = []
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

    #creates an array of all components parents and associated products
    @items_to_select = (@component.component_parents + @component.products + [@component.group] + @component.valuefields)
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

    if(!params[:group_id].nil?)
      @component.group = Group.find(params[:group_id])
    end

    if(!params[:product_ids].nil?)
      @component.products = Product.find(params[:product_ids])
    end

    if(!params[:component_parent_ids].nil?)
      @component.component_parents = Component.find(params[:component_parent_ids])
    end

    if(!params[:valuefield_ids].nil?)

      vfs = Valuefield.find(params[:valuefield_ids])
      @component.valuefields = vfs

      for vf in vfs
        if(!@component.properties.include?(vf.property))
          @component.properties.push(vf.property)
        end
      end

    end
    respond_to do |format|
      if @component.save
        format.html { redirect_to session[:rq], notice: 'Component was successfully created.' }
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

    #Set Component Group to nil
    if(!@component.group_id.nil?)
      @component.group_id = nil
    end
    #Sets Component Group with new params
    if(!params[:group_ids].nil?)
      for id in params[:group_ids]
        @component.group_id = id
      end
    end

    #Products
    if(!@component.products.nil?)
      @component.products.clear
    end
    #Sets the Component to the Product
    if(!params[:Product_ids].nil?)
      for prod in params[:Product_ids]
        @component.products.push(Product.find(prod))
      end
    end

    #Parent Components
    if(!@component.component_parents.nil?)
      @component.component_parents.clear
    end
    if(!params[:component_parent_ids].nil?)
      for cp in params[:component_parent_ids]
        @component.component_parents.push(Component.find(cp))
      end
    end

    #Images
    if(!@component.images.nil?)
      @component.images.clear
    end
    if(!params[:Image_ids].nil?)
      for id in params[:Image_ids]
        @component.images.push(Image.find(id))
      end
    end

    #Data Files
    if(!@component.data_files.nil?)
      @component.data_files.clear
    end
    if(!params[:DataFile_ids].nil?)
      for id in params[:DataFile_ids]
        @component.data_files.push(DataFile.find(id))
      end
    end

    #Valuefields
    if(!@component.valuefields.nil?)
      @component.valuefields.clear
      @component.properties.clear
    end
    if(!params[:valuefield_ids].nil?)
      for id in params[:valuefield_ids]
        @component.valuefields.push(Valuefield.find(id))
      end
      for vf in @component.valuefields
        if(!@component.properties.include?(Property.find(vf.property_id)))
          @component.properties.push(Property.find(vf.property_id))
        end
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
      format.html { redirect_to '/admin' }
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
