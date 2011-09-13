class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  def index
    @tmp_array = []
    @categories = Category.all
    @all_categories =  Category.all
    @all_categories_hash = {}
    @s = ""

    sort_categories()

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  #Function to show selected category
  def show
    @category = Category.find(params[:id])
    @all_categories =  Category.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  #Function
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
    logger.info("+++++++++++++++++++++++++++destroy_category category #{category.name}")
    if(category == nil || category.id == nil)
        return
    end

    if(@all_categories_hash[category.id] != nil)
      for child in @all_categories_hash[category.id]
       destroy_category(child)
      end
    end
    category.destroy
  end

  #Function to sort the categories array
   def sort_categories
    logger.info("+++++++++++++++++++++++++++ Sort_category begin #{@all_categories}")

    for cat in @all_categories


      if(cat.parent_id == nil)
         @all_categories_hash[0] = [cat]

      else

        #logger.info("+++++++++++++++++++++++++++I'm looking for this: #{cat}")

        if(@all_categories_hash[cat.parent_id] == nil)
          @all_categories_hash[cat.parent_id] = []
        end

        @all_categories_hash[cat.parent_id].push(cat)
      end
    end

    #logger.info("+++++++++++++++++++++++++++I'm looking for this: #{@all_categories_hash.inspect}")

    for key in @all_categories_hash.keys
      @all_categories_hash[key].sort!{|x,y| x.name <=> y.name}
    end

      logger.info("+++++++++++++++++++++++++++Sort_category end #{@all_categories_hash}")
  end

end
