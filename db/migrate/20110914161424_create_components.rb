class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.string :description
      t.string :group_id
      t.string :code_component
      t.string :model_path

      t.timestamps
    end
  end
end
