class ComponentsDataFiles < ActiveRecord::Migration
  def up
    create_table("components_data_files", :id=>false) do |cp|
      cp.column "component_id", :integer
      cp.column "data_file_id", :integer
    end
  end

  def down
    drop_table "components_data_files"
  end
end
