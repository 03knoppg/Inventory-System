class CreateValuefields < ActiveRecord::Migration
  def change
    create_table :valuefields do |t|
      t.string :fieldvalue
      t.integer :property_id
      t.integer :product_id
      t.integer :component_id
      t.string :path
      t.string :code_valuefield

      t.timestamps
    end
  end
end
