class ProductsValuefields < ActiveRecord::Migration
  def self.up
    create_table("products_valuefields", :id=>false) do |cp|
      cp.column "product_id", :integer
      cp.column "valuefield_id", :integer
    end

  end

  def self.down
    drop_table "products_valuefields"
  end
end
