class ComponentsValuefields < ActiveRecord::Migration
  def up
     create_table("components_valuefields", :id=>false) do |cp|
      cp.column "component_id", :integer
      cp.column "valuefield_id", :integer
    end
  end

  def down
     drop_table "components_valuefields"
  end
end
