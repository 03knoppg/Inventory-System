class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :field_type
      t.string :description
      t.string :name

      t.timestamps
    end
  end
end
