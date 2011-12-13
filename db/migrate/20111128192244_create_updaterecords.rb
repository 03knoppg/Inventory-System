class CreateUpdaterecords < ActiveRecord::Migration
  def change
    create_table :updaterecords do |t|
      t.string :table_name
       t.integer :entry_id
       t.datetime :time
       t.timestamps

    end

    add_index :updaterecords, [:table_name, :entry_id], :unique=> true
    #add_index :time
  end

end
