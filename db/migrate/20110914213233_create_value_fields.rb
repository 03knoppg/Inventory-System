class CreateValueFields < ActiveRecord::Migration
  def change
    create_table :value_fields do |t|
      t.string :field_value
      t.integer :attribute_id
      t.integer :product_id

      t.timestamps
    end
  end
end
