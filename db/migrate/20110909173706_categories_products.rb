class CategoriesProducts < ActiveRecord::Migration
  def self.up
    create_table("categories_products", :id=>false) do |cp|
      cp.column "category_id", :integer
      cp.column "product_id", :integer
    end
    Category.new do |category|
      category.name = "All"
      Product.find(:all).each {|product| category.products << product}
      category.save
    end
  end

  def self.down
    drop_table "categories_products"
  end
end
