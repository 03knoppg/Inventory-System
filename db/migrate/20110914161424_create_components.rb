class CreateComponents < ActiveRecord::Migration
  def change
    create_table :all_components do |t|
      t.string :name
      t.string :description
      t.string :group_id
      t.string :code

      t.timestamps
    end
  end
end
