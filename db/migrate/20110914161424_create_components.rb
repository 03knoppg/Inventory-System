class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.string :description
      t.integer :group_id
      t.string :code

      t.timestamps
    end
  end
end
