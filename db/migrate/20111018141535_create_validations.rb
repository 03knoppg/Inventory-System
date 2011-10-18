class CreateValidations < ActiveRecord::Migration
  def change
    create_table :validations do |t|
      t.string :extension
      t.string :kind

      t.timestamps
    end
  end
end
