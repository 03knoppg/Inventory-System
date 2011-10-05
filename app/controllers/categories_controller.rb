#Controller file for Categories
class CategoriesController < ApplicationController



  # GET /categories
  # GET /categories.json
  def index
    @tmp_array = []
    @categories = Category.all
    @all_categories =  Category.all
    @all_categories_hash = {}
    @s = ""

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
    @category = Category.find(params[:id])
    @parent = @category.parent_id ? Category.find(@category.parent_id) : nil
    @all_categories =  Category.all
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
    @category = Category.new
    @all_categories =  Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  #Function to edit a category
  def edit
    @category = Category.find(params[:id])
    @all_categories =  Category.all
    @child_categories = []
    remove_children(@all_categories, @category)

    @all_categories = @all_categories - @child_categories

  end

  # POST /categories
  # POST /categories.json
  #Funtion to create a category
  def create

    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
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
    @category = Category.find(params[:id])
    @all_categories =  Category.all
    @all_categories_hash = {}
    sort_categories()
    destroy_category(@category)

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :ok }
    end
  end

  #Function to destroy a parent category and its children
  def destroy_category(category)
    #if category and id are nil return, else destroy all children of category then destroy parent.
    if(category == nil || category.id == nil)
        return
    end
    if(@all_categories_hash[category.id] != nil)
      for child in @all_categories_hash[category.id]
        #calls itself to destroy children.
       destroy_category(child)
      end
    end
    #destroy parent category
    category.destroy
  end

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
     if(cat.parent_id == nil)
         @all_categories_hash[0] = [cat]
     else
       if(@all_categories_hash[cat.parent_id] == nil)
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
