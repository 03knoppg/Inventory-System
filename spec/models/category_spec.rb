require 'spec_helper'

describe Category do
  it "can be instantiated" do
    Category.new.should be_an_instance_of(Category)
  end

  it "can be saved successfully" do
    test_category_1 = create_category("Test Category 1 Save", nil, nil)
    test_category_1.should be_persisted
  end

  it "can be updated successfully" do
    test_category_2 = create_category("Test Category 2 Update", nil, nil)
    test_category_2.should be_persisted
    test_category_2.update_attributes({:name => "Test Changed Category 2 Update", :code_category => "TEST2UPDATE"})
    test_category_2.should be_persisted
  end

  it "can be deleted successfully" do
    test_category_3 = create_category("Test Category 3 Delete", nil, nil)
    test_category_3.destroy
  end

  it "can be parented successfully" do
    test_category_4 = create_category("Test Category 4 Parent of 5", nil, nil)
    test_category_4.should be_persisted
    test_category_5 = create_category("Test Category 5 Child of 4", test_category_4.id, "TEST5CHILDOF4")
    test_category_5.should be_persisted
  end
end