require 'spec_helper'

describe Property do
  it "can be instantiated" do
    Property.new.should be_an_instance_of(Property)
  end

  it "can be saved successfully" do
    property = create_property("string", "Test Property 1 Save Description", "Test Property 1 Save")
    property.should be_persisted
  end

  it "can be updated successfully" do
    property = create_property("string", "Test Property 2 Update Description", "Test Property 2 Update")
    property.update_attributes({:field_type => "decimal", :name => "Test Changed Property 2 Update", :description => "Test Changed Property 2 Update Description"})
    property.should be_persisted
  end

  it "can be deleted successfully" do
    property = create_property("string", "Test Property 3 Delete Description", "Test Property 3 Delete")
    property.destroy
  end

  it "can be built successfully" do
    property = create_property("string", "Test Property 4 Build Description", "Test Property 4 Build")
    component = create_component("Component Test - Property 4 Build", "Component Test - Property 4 Build Description", nil, "TEST4BUILD")
    product = create_product("Product Test - Property 4 Build", "Product Test - Property 4 Build Description", "TEST4BUILD")
    valuefield_1 = create_valuefield("Valuefield 1 Test - Property 4 Build", property.id, nil, "TEST4BUILD")
    valuefield_2 = create_valuefield("Valuefield 2 Test - Property 4 Build", property.id, nil, "TEST4BUILD")

    property.components = [component]
    property.products = [product]
    product.valuefields = [valuefield_1]
    component.valuefields = [valuefield_2]

    property.should be_persisted
  end
end