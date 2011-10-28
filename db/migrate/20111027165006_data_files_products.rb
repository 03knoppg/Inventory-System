class DataFilesProducts < ActiveRecord::Migration
  def up
    create_table("data_files_products", :id=>false) do |cp|
      cp.column "data_file_id", :integer
      cp.column "product_id", :integer
    end
  end

  def down
    drop_table "data_files_products"
  end
end
