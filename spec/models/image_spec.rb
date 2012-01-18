require 'spec_helper'

describe Image do
  it "can be instantiated" do
    Image.new.should be_an_instance_of(Image)
  end

  it "can be saved successfully" do
    image = create_image("/home/hans2/public_html/Inventory-System/app/assets/images/Company_Logo.png")
    image.should be_persisted
  end

  it "can be updated successfully" do
    image = create_image("/home/hans2/public_html/Inventory-System/app/assets/images/Company_Logo.png")
    image.update_attribute(:picture, File.open("/home/hans2/public_html/Inventory-System/app/assets/images/Company_Banner.png"))
    image.should be_persisted
  end

  it "can be deleted successfully" do
    image = create_image("/home/hans2/public_html/Inventory-System/app/assets/images/Company_Banner.png")
    image.destroy
  end

  it "can be built successfully" do
    image = create_image("/home/hans2/public_html/Inventory-System/app/assets/images/Company_Logo.png")
    component = create_component("Component Test - Image 1 Build", "Component Test - Image 1 Build Description", nil, "TEST1BUILD")
    product = create_product("Product Test - Image 1 Build", "Product Test - Image 1 Build Description", "TEST1BUILD")
    valuefield = create_valuefield("Valuefield 1 Test - Image 1 Build", nil, nil, "TEST1BUILD")

    image.components = [component]
    image.products = [product]
    image.valuefields = [valuefield]

    image.should be_persisted
  end
end