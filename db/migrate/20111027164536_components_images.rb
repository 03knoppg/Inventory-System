class ComponentsImages < ActiveRecord::Migration
  def up
    create_table("components_images", :id=>false) do |cp|
      cp.column "component_id", :integer
      cp.column "image_id", :integer
    end
  end

  def down
    drop_table "components_images"
  end
end
