require 'spec_helper'

describe Component do
  it "can be instantiated" do
    Component.new.should be_an_instance_of(Component)
  end

  it "can be saved successfully" do
    component = create_component("Test Component 1 Save", "Test Component 1 Save Description", nil, "TEST1SAVE")
    component.should be_persisted
  end

  it "can be updated successfully" do
    component = create_component("Test Component 2 Update", "Test Component 2 Update Description", nil, "TEST2UPDATE")
    component.update_attributes({:name => "Test Changed Component 2 Update", :description => "Test Changed Component 2 Update Description", :code => "TEST2UPDATECHANGED"})
    component.should be_persisted
  end

  it "can be deleted successfully" do
    component = create_component("Test Component 3 Delete", "Test Component 3 Delete Description", nil, nil)
    component.destroy
  end

  it "can be parent/child successfully" do
    component_parent = create_component("Test Component 4 Parent", "Test Component 4 Parent Description", nil, "TEST4PARENT")
    component_parent_child = create_component("Test Component 5 Parent/Child", "Test Component 5 Parent/Child Description", nil, "TEST5PARENTCHILD")
    component_child = create_component("Test Component 6 Child", "Test Component 6 Child Description", nil, "TEST6CHILD")

    component_parent.components = [component_parent_child]
    component_child.component_parents = [component_parent_child]

    component_parent.should be_persisted
    component_parent_child.should be_persisted
    component_child.should be_persisted
  end

  it "can be built successfully" do
    component = create_component("Test Component 7 Build", "Test Component 7 Build Description", nil, "TEST7BUILD")
    product = create_product("Product Test - Component 7 Build", "Product Test - Component 7 Build Description", "TEST7BUILD")
    category = create_category("Category Test - Component 7 Build", nil, "TEST7BUILD")
    property = create_property("string", "Property Test - Component 7 Build Description", "Property Test - Component 7 Build")
    valuefield = create_valuefield("Valuefield Test - Component 7 Build", property, nil, "TEST7BUILD")
    image = create_image("/home/hans2/public_html/Inventory-System/app/assets/images/Company_Logo.png")
    data_file = create_data_file("/home/hans2/public_html/Inventory-System/app/assets/No_Textures_version_Series82_0_19.DAE")

    product.categories = [category]
    component.products = [product]
    component.properties = [property]
    component.valuefields = [valuefield]
    component.images = [image]
    component.data_files = [data_file]

    component.should be_persisted
  end
end