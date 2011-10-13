class ComponentsProperties < ActiveRecord::Migration
  def up
     create_table("components_properties", :id=>false) do |cp|
      cp.column "component_id", :integer
      cp.column "property_id", :integer
    end
  end

  def down
     drop_table "components_properties"
  end
end
