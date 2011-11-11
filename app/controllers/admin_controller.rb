class AdminController < ApplicationController


  #Function for tabs page
  def tabs
    @product = Product.find(params[:id])
    @product_components = @product.components
    @product_valuefields = @product.valuefields
    @product_properties = @product.properties
    @product_images = @product.images
    @product_datafiles = @product.data_files
    @groups = Group.all
    @properties = Property.all

    @reset_component = Component.new
  end

  #Update category for tabs page
  def updatecategory
    @all_categories = Category.all
    @category = Category.new(params[:category])
    @category.name = "name"

    if @category.save
      respond_to do |format|
        format.js
      end
     #
     # else
     #   format.html { render action: "categories/new", :controller => :categories }
     #   format.json { render json: @category.errors, status: :unprocessable_entity }
    end
  end

  def home
  end

  def writefile
    path = params[:path]    #the permuted path
  end

  def addvalue
    @tmp_array = []
    @categories = Category.all
    @all_categories =  Category.all
    @all_categories_hash = {}
    @all_properties = Property.all
    @valuefield = Valuefield.new

    if(params[:item] == nil)
      @items = Category.all
      @type = "a"
    else
      @path = params[:path]    #the permuted path
      choice = params[:item]   #the id of the item the user clicked on
      path = update_path(@path, choice)
      next_table(path)
    end

    @path = path

    respond_to do |format|
      format.html
      format.js
    end
  end

  #Create a valuefield associated to a path
  def create
    @valuefield = Valuefield.new(params[:valuefield])
    @valuefield.property = Property.find(Integer(params[:property_id]))
    @valuefield.path = params[:path]

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

  #replace the choice group with the selection the user clicked on
  def update_path(path, choice)
    if( choice.start_with?("a") )   #category was chosen
      if(path != "")
        path += "|"
      end

      path += choice + "|p"

      for product in Category.find(choice[1..choice.length]).products
        path += ":#{product.id}"
      end

      return path
    end

    path = path.split("|")

    for part in path
      if(part[0] == choice[0] && part.match("#{choice[0]}(:|$)") != nil) #find the part in the path that will be replaced
        if(choice.start_with?("p"))
          comp = Product.find(choice[1..choice.length])
        elsif(choice.start_with?("c"))
          comp = Component.find(choice[1..choice.length])
        else #valuefield
          index = path.index(part)
          path[index] = "#{choice}"#insert component + valuefields + choices here
          return path.join("|") #no children so return
        end

        #first sort the valuefields for the entry and create a sub path to be inserted
        valuefield_hash = sort_valuefield_children(comp.valuefields)

        val_entry = generate_entry(valuefield_hash,"v")

       #then sort the children for the entry and create a sub path to be inserted
        child_hash = sort_component_children(comp.components)

        comp_entry = generate_entry(child_hash,"c")

        index = path.index(part)

        path[index] = comp_entry
        path.insert(index, val_entry)
        path.insert(index, "#{choice}")        #   insert   ...entry | val_entry | comp_entry...     in proper place

        path.delete("")
        return path.join("|")
      end
    end
    logger.info("\n\n\n\n\n no match found \n\n\n\n\n\n")
  end

  #builds a sub path string for an entry
  def generate_entry(hash,type)
    entry = []
    for group in hash.keys
      if(group == "no_group")  #no_group means all choices are mandatory
        for child_comp in hash[group]
            entry.push("#{type}:#{child_comp.id}")
        end
      else                    #otherwise choose one of the grouped members
        group_group = "#{type}"
        for child_comp in hash[group]
          if(!(type=="v" && hash[group].length == 1))   #manditory valuefields are not prepended with :
             group_group += ":"
          end
          group_group += "#{child_comp.id}"
        end
        entry.push(group_group)
      end
    end
    #logger.info("\n\n\n\n\n entry:#{entry} join:#{entry.join("|")} \n\n\n\n\n\n")
    entry.join("|")
  end

  def sort_component_children(children)      #sorts components into a hash by their group
    hash = {"no_group"=>[]}
    for child in children
      if(child.group == nil)
        hash["no_group"].push(child)
      else
        if (!hash.key?(child.group))
          hash[child.group] = []
        end
        hash[child.group].push(child)
      end
    end
    hash
  end

  def sort_valuefield_children(children)          #sorts valuefields into a hash by their group
    hash = {"no_group"=>[]}
    for child in children
      if(child.property == nil)
        hash["no_group"].push(child)
      else
        if (!hash.key?(child.property))
          hash[child.property] = []
        end
        hash[child.property].push(child)
      end
    end
    hash
  end

  def next_table(path)                          #set the items and type to display for the next select table
    split_path = path.split("|")
    item = nil
    for part in split_path
       if(part[1] == ":")
         item = part
         break
       end
    end
    if(item == nil) #ALL DONE
      @type = "DONE"
      return
    end

    item_type = item[0]

    if(item_type == "a") #category
      item_id = item[1..split_path.last.length]
      @items = Category.find(item_id).products
      @type = "a"
    elsif(item_type == "v") #valuefield
      @items  = find_next_choices(item)
      @type = "v"
    elsif(item_type == "p") #product
      @items  = find_next_choices(item)
      @type = "p" #assume products dont contain valuefields for now
    else #component
        @items = find_next_choices(item)
        @type = "c"
    end
  end

  def find_next_choices(path_arg)             #populate the items for the next select table
    items = []
    type = path_arg[0]
    part = path_arg[2..path_arg.length].split(":") #remove leading type and :

    for element in part
        if(type == "c")
          items.push Component.find(element)
        elsif(type == "v")
          items.push Valuefield.find(element)
        elsif(type == "p")
          items.push Product.find(element)
        end
    end
    return items
  end

  #Function to sort the categories array
  def sort_categories
    for cat in @all_categories
      if(cat.parent_id == nil)
        @all_categories_hash[0] = [cat]
      else
        if(@all_categories_hash[cat.parent_id] == nil)
          @all_categories_hash[cat.parent_id] = []
        end
        @all_categories_hash[cat.parent_id].push(cat)
      end
    end
    for key in @all_categories_hash.keys
      @all_categories_hash[key].sort!{|x,y| x.name <=> y.name}
    end
  end

  def ajax_fill_select
    @prod = Product.find(params[:id])
    respond_to do |format|
      format.html { render :partial => :fill_select}
    end

  end

  def debug_hash(hash)
    logger.info("\n\n\n\n\n\n\nHASH:\n\n")
    for key in hash.keys
      logger.info("#{key.inspect}\n")
      for val in hash[key]
        logger.info("#{val.inspect}\n")
      end
    end
  end
end
