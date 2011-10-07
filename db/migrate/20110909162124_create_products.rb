class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :code
      t.string :model_path

      t.timestamps
    end
  end
end
