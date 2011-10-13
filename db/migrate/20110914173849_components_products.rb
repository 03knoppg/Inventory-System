class ComponentsProducts < ActiveRecord::Migration
  def self.up
    create_table("components_products", :id=>false) do |cp|
      cp.column "component_id", :integer
      cp.column "product_id", :integer
    end

  end

  def self.down
    drop_table "components_products"
  end
end
