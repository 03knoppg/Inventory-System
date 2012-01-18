require 'spec_helper'

describe Validation do
  it "can be instantiated" do
    Validation.new.should be_an_instance_of(Validation)
  end

  it "can be saved successfully" do
    validation = create_validation(".png", "Image")
    validation.should be_persisted
  end

  it "can be updated successfully" do
    validation = create_validation(".jpg", "Image")
    validation.update_attributes({:extension => ".DAE", :type => "Data File"})
    validation.should be_persisted
  end

  it "can be deleted successfully" do
    validation = create_validation(".jpg", "Image")
    validation.destroy
  end
end