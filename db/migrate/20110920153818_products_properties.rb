class ProductsProperties < ActiveRecord::Migration
  def up
     create_table("products_properties", :id=>false) do |cp|
      cp.column "product_id", :integer
      cp.column "property_id", :integer
    end
  end

  def down
     drop_table "products_properties"
  end
end
