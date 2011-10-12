class AddAttachmentFiledataToDataFile < ActiveRecord::Migration
  def self.up
    add_column :data_files, :filedata_file_name, :string
    add_column :data_files, :filedata_content_type, :string
    add_column :data_files, :filedata_file_size, :integer
    add_column :data_files, :filedata_updated_at, :datetime
  end

  def self.down
    remove_column :data_files, :filedata_file_name
    remove_column :data_files, :filedata_content_type
    remove_column :data_files, :filedata_file_size
    remove_column :data_files, :filedata_updated_at
  end
end
