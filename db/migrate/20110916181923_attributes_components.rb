class AttributesComponents < ActiveRecord::Migration
 def self.up
  create_table("attributes_components", :id=>false) do |cp|
      cp.column "component_id", :integer
      cp.column "attribute_id", :integer
    end

  end

  def self.down
    drop_table "attributes_components"
  end
end
