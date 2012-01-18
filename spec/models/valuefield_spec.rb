require 'spec_helper'

describe Valuefield do
  it "can be instantiated" do
    Valuefield.new.should be_an_instance_of(Valuefield)
  end

  it "can be saved successfully" do
    valuefield = create_valuefield("Test Valuefield 1 Save", nil, nil, "TEST1SAVE")
    valuefield.should be_persisted
  end

  it "can be updated successfully" do
    valuefield = create_valuefield("Test Valuefield 2 Update", nil, nil, "TEST2UPDATE")
    valuefield.update_attributes({:fieldvalue => "Test Changed Valuefield 2 Update", :code => "TESTCHANGED2UPDATE"})
    valuefield.should be_persisted
  end

  it "can be deleted successfully" do
    valuefield = create_valuefield("Test Valuefield 3 Delete", nil, nil, "TEST3DELETE")
    valuefield.destroy
  end

  it "can be built successfully" do
    property = create_property("string", "Property Test - Product 4 Build Description", "Property Test - Product 4 Build")
    valuefield = create_valuefield("Test Valuefield 4 Build", property.id, nil, "TEST4BUILD")
    product = create_product("Product Test - Valuefield 4 Build", "Product Test - Valuefield 4 Build Description", nil)
    component = create_component("Component Test - Valuefield 4 Build", "Component Test - Valuefield 4 Build Description", nil, "TEST4BUILD")
    image = create_image("/home/hans2/public_html/Inventory-System/app/assets/images/Company_Logo.png")
    data_file = create_data_file("/home/hans2/public_html/Inventory-System/app/assets/No_Textures_version_Series82_0_19.DAE")

    component.properties = [property]
    product.properties = [property]
    valuefield.components = [component]
    valuefield.products = [product]
    valuefield.images = [image]
    valuefield.data_files = [data_file]

    valuefield.should be_persisted
  end
end