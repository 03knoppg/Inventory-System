class AdminController < ApplicationController

  def home
  end

  def addvalue

    @tmp_array = []
    @categories = Category.all
    @all_categories =  Category.all
    @all_categories_hash = {}
    @s = ""


    if(params[:item] == nil)

      @items = Category.all
      @type = "a"

    else


      @path = params[:path] + params[:item]+ "|"


      #logger.info("\n\n\n\n\n SSSSSSSSSSSSSSSSSSSSSSSSSSSSS #{params[:path]}\n\n\n\n\n")

      next_table(@path)


    end





    sort_categories

    respond_to do |format|
      format.html
      format.js
    end

  end

  def next_table(path)

    split = path.split("|")

    chosen_properties = []

    while(split.last.start_with?("v"))
      v_id = split.last[1..split.last.length]
      split.pop
      chosen_properties.push(Valuefield.find(v_id).property.id)
    end

    item_type = split.last[0]
    item_id = split.last[1..split.last.length]

    if(item_type == "a") #category
      @items = Category.find(item_id).products
      @type = "p"

    elsif(item_type == "p") #product
      @items  = Product.find(item_id).components
      @type = "c"

    else #component
      all_valuefields = Component.find(item_id).valuefields
      all_valuefields_hash = {}

      for valuefield in all_valuefields
         if(!all_valuefields_hash.has_key?(valuefield.property.id))
            all_valuefields_hash[valuefield.property.id] = []
         end
        all_valuefields_hash[valuefield.property.id].push(valuefield)
      end

      for property_id in chosen_properties
        all_valuefields_hash.delete(property_id)
      end


         #need to choose another valuefield
      if(!all_valuefields_hash.empty?)
        @items = all_valuefields_hash.shift[1]
        @type = "v"


      else             #need to choose next component

        @items = Component.find(item_id).components
        @type = "c"

      end


    end


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




end
