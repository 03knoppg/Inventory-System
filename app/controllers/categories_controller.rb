#Controller class for Categories
class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  #Function for index page
  def index
    #creates a sorted array using all category objects
    @all_categories =  Category.all.sort {|x,y| x.name <=> y.name }
    #creates an empty hash
    @all_categories_hash = {}
    #calls function to populate & sort @all_categories_hash
    sort_categories
    respond_to do |format|
      format.html # mainmenu.html.erb
      format.json { render json: @categories }
      format.xml { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  #Function to show selected category
  def show
    #locates the selected category
    @category = Category.find(params[:id])
    #assigns the parent of the selected category
    @parent = @category.parent_id ? Category.find(@category.parent_id) : nil
    #creates a sorted array using all categories
    @all_categories =  Category.all.sort {|x,y| x.name <=> y.name }
    #creates a sorted array using all related products
    @related_products = @category.products.sort {|x,y| x.name <=> y.name }

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
      format.xml { render :xml => @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  #Function for new category
  def new
    #creates a sorted array using all category objects
    @all_categories =  Category.all.sort {|x,y| x.name <=> y.name }
    #if statement for duplicating a record
    if params[:duplicate_category]
        #Assign category to be duplicated
        category_to_duplicate = Category.find params[:duplicate_category]
        #set @category to duplicated info minus id
        @category = category_to_duplicate.dup
    else
        #New category
        @category = Category.new
        if(!params[:category_id].nil?)
          @items_to_select = Category.find params[:category_id]
        end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  #Function to edit a category
  def edit
    #locates the selected category
    @category = Category.find(params[:id])
    #creates a sorted array using all categories
    @all_categories =  Category.all.sort {|x,y| x.name <=> y.name }
    #creates an empty hash
    @child_categories = []
    #call to function to remove children - a parent cannot be moved to be a child of its own child.
    remove_children(@all_categories, @category)
    #re-assigns the array minus the categories children
    @all_categories = @all_categories - @child_categories

    @items_to_select = [Category.find(@category.parent_id)]
  end

  # POST /categories
  # POST /categories.json
  #Funtion to create a category
  def create
    #Creates the category to be saved in the db
    @category = Category.new(params[:category])
    @all_categories = Category.all

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  #Function to update a category
  def update
    #locates the category to be updated
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  #Function to destroy a category
  def destroy
    #locates the category to be destroyed
    @category = Category.find(params[:id])
    #Creates an array of all categories
    @all_categories =  Category.all
    #creates an empty hash
    @all_categories_hash = {}
    #calls function to populate & sort @all_categories_hash
    sort_categories()
    #calls function to destroy the category
    destroy_category(@category)

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :ok }
    end
  end

  #Function to destroy a parent category and its children
  def destroy_category(category)
    #if category and id are nil return, else destroy all children of category then destroy parent.
    if(category.nil? || category.id.nil?)
        return
    end
    if(!@all_categories_hash[category.id].nil?)
      for child in @all_categories_hash[category.id]
        #calls itself to destroy children.
       destroy_category(child)
      end
    end
    #destroy parent category
    category.destroy
  end

  #Function to remove children of a category when edit is called
  def remove_children(categories, category)
     for cat in categories
      if(cat.parent_id == category.id)
         @child_categories.push(cat)
         remove_children(categories, cat)
      end
     end
    @child_categories.push(category)
  end

  #Function to sort the categories array
   def sort_categories
    #loop to sort categories parents and children
    for cat in @all_categories
     #if category parent id == nill then hash = current category else if parent id of category = nil then parent id hash is nil
     if(cat.parent_id.nil?)
         @all_categories_hash[0] = [cat]
     else
       if(@all_categories_hash[cat.parent_id].nil?)
          @all_categories_hash[cat.parent_id] = []
        end
        @all_categories_hash[cat.parent_id].push(cat)
      end
    end
    #Sort loop for categories
    for key in @all_categories_hash.keys
      @all_categories_hash[key].sort!{|x,y| x.name <=> y.name}
    end
  end
end
