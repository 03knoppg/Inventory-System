class ComponentsComponents < ActiveRecord::Migration
  def up
    create_table("components_components", :id=>false) do |cp|
      cp.column "component_parent_id", :integer
      cp.column "component_child_id", :integer

    end

  end

  def self.down
    drop_table "components_components"
  end
end
