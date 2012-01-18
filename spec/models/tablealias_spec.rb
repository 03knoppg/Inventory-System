require 'spec_helper'

describe TableAlias do
  it "can be instantiated" do
    TableAlias.new.should be_an_instance_of(TableAlias)
  end

  it "can be saved successfully" do
    table_alias = create_table_alias("Category", "File Structure")
    table_alias.should be_persisted
  end

  it "can be updated successfully" do
    table_alias = create_table_alias("Product", "Product")
    table_alias.update_attributes({:aliasName => "Item"})
    table_alias.should be_persisted
  end

  it "can be deleted successfully" do
    table_alias = create_table_alias("Component", "Part")
    table_alias.destroy
  end
end