class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :name
      t.string :description
      t.string :field_type

      t.timestamps
    end
  end
end
