require 'spec_helper'

describe Product do
  it "can be instantiated" do
    Product.new.should be_an_instance_of(Product)
  end

  it "can be saved successfully" do
    product = create_product("Test Product 1 Save", "Test Product 1 Save Description", nil)
    product.should be_persisted
  end

  it "can be updated successfully" do
    product = create_product("Test Product 2 Update", "Test Product 2 Update Description", nil)
    product.update_attributes({:name => "Test Changed Product 2 Update", :description => "Test Changed Product 2 Update Description", :code => "TEST2UPDATE"})
    product.should be_persisted
  end

  it "can be deleted successfully" do
    product = create_product("Test Product 3 Delete", "Test Product 3 Delete Description", nil)
    product.destroy
  end

  it "can be built successfully" do
    product = create_product("Test Product 4 Build", "Test Product 4 Build Description", nil)
    category = create_category("Category Test - Product 4 Build", nil, nil)
    component = create_component("Component Test - Product 4 Build", "Component Test - Product 4 Build Description", nil, "TEST4BUILD")
    property = create_property("string", "Property Test - Product 4 Build Description", "Property Test - Product 4 Build")
    valuefield = create_valuefield("Valuefield Test - Product 4 Build", property, nil, "TEST4BUILD")
    image = create_image("/home/hans2/public_html/Inventory-System/app/assets/images/Company_Logo.png")
    data_file = create_data_file("/home/hans2/public_html/Inventory-System/app/assets/No_Textures_version_Series82_0_19.DAE")

    product.categories = [category]
    product.components = [component]
    product.properties = [property]
    product.valuefields = [valuefield]
    product.images = [image]
    product.data_files = [data_file]

    product.should be_persisted
  end
end