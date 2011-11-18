class CreateValuefields < ActiveRecord::Migration
  def change
    create_table :valuefields do |t|
      t.string :fieldvalue
      t.integer :property_id
      t.string :path
      t.string :code

      t.timestamps
    end
  end
end
