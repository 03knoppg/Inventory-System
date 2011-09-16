class AttributesProducts < ActiveRecord::Migration
 def self.up
    create_table("attributes_products", :id=>false) do |cp|
      cp.column "product_id", :integer
      cp.column "attribute_id", :integer
    end

  end

  def self.down
    drop_table "attributes_products"
  end
end
