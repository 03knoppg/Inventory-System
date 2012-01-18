require 'spec_helper'

describe DataFile do
  it "can be instantiated" do
    DataFile.new.should be_an_instance_of(DataFile)
  end

  it "can be saved successfully" do
    data_file = create_data_file("/home/hans2/public_html/Inventory-System/app/assets/No_Textures_version_Series82_0_19.DAE")
    data_file.should be_persisted
  end

  it "can be updated successfully" do
    data_file = create_data_file("/home/hans2/public_html/Inventory-System/app/assets/No_Textures_version_Series82_0_19.DAE")
    data_file.update_attribute(:filedata, File.open("/home/hans2/public_html/Inventory-System/app/assets/No_Textures_version_Series82_0.DAE"))
    data_file.should be_persisted
  end

  it "can be deleted successfully" do
    data_file = create_data_file("/home/hans2/public_html/Inventory-System/app/assets/No_Textures_version_Series82_0_19.DAE")
    data_file.destroy
  end

  it "can be built successfully" do
    data_file = create_data_file("/home/hans2/public_html/Inventory-System/app/assets/No_Textures_version_Series82_0_19.DAE")
    component = create_component("Component Test - Data File 1 Build", "Component Test - Data File 1 Build Description", nil, "TEST1BUILD")
    product = create_product("Product Test - Data File 1 Build", "Product Test - Data File 1 Build Description", "TEST1BUILD")
    valuefield = create_valuefield("Valuefield 1 Test - Data File 1 Build", nil, nil, "TEST1BUILD")

    data_file.components = [component]
    data_file.products = [product]
    data_file.valuefields = [valuefield]

    data_file.should be_persisted
  end
end