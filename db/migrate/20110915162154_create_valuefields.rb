class CreateValuefields < ActiveRecord::Migration
  def change
    create_table :valuefields do |t|
      t.string :fieldvalue
      t.integer :attribute_id

      t.timestamps
    end
  end
end
