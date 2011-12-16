class CreateTableAliases < ActiveRecord::Migration
  def change
    create_table :table_aliases do |t|
      t.string :tableName
      t.string :aliasName
      t.timestamps
    end
  end
end
