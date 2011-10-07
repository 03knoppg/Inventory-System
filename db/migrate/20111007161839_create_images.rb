class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :component_id
      t.integer :product_id
      t.integer :valuefield_id
      t.timestamps
    end
  end
end
