class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :field_type
      t.string :value
      t.integer :attribute_id

      t.timestamps
    end
  end
end
