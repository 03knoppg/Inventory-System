class DataFilesValuefields < ActiveRecord::Migration
  def up
    create_table("data_files_valuefields", :id=>false) do |cp|
      cp.column "data_file_id", :integer
      cp.column "valuefield_id", :integer
    end
  end

  def down
    drop_table "data_files_valuefields"
  end
end
