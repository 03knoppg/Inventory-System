class CreateDataFiles < ActiveRecord::Migration
  def change
    create_table :data_files do |t|
      t.integer :component_id
      t.integer :product_id
      t.integer :valuefield_id
      t.timestamps
    end
  end
end
