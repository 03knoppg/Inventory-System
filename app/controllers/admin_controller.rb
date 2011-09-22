class AdminController < ApplicationController

  def home
  end

  def addvalue
    @tmp_array = []
    @categories = Category.all
    @all_categories =  Category.all
    @all_categories_hash = {}
    @s = ""

    logger.info("\n\n\n\n\n SSSSSSSSSSSSSSSSSSSSSSSSSSSSS \n\n\n\n\n")

    sort_categories

  end

  #Function to sort the categories array
   def sort_categories
    #logger.info("+++++++++++++++++++++++++++ Sort_category begin #{@all_categories}")
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

      #logger.info("+++++++++++++++++++++++++++Sort_category end #{@all_categories_hash}")
  end

end
