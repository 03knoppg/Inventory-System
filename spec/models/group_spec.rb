require 'spec_helper'

describe Group do
  it "can be instantiated" do
    Group.new.should be_an_instance_of(Group)
  end

  it "can be saved successfully" do
    group = create_group("Test Group 1 Save")
    group.should be_persisted
  end

  it "can be updated successfully" do
    group = create_group("Test Group 2 Update")
    group.update_attributes({:name => "Test Changed Group 2 Update"})
    group.should be_persisted
  end

  it "can be deleted successfully" do
    group = create_group("Test Group 3 Delete")
    group.destroy
  end

  it "can be built successfully" do
    group = create_group("Test Group 4 Build")
    component = create_component("Component Test 1 - Group 4 Build", "Component Test 1 - Group 4 Build Description", group.id, "TEST4BUILD")
    component = create_component("Component Test 2 - Group 4 Build", "Component Test 2 - Group 4 Build Description", group.id, "TEST4BUILD")

    group.should be_persisted
  end
end