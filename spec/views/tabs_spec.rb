require 'spec_helper'

describe "admin/tabs.html.erb" do

  #Checks and Renders Tabs Page
  it "should display a title" do
    category = Category.create(name: "Hello Category", parent_id: nil)
    #category = mock_model(Category, :name => "Hello Category", :parent_id => nil)
    property = Property.create(name: "Hello Property", description: "Hello Property Description", field_type: "string")
    #property = mock_model(Property, :name => "testProp", :description => "Its a test", :field_type => "String")
    valuefield = Valuefield.create(fieldvalue: "Hello Valuefield", property_id: property.id)
    #valuefield = mock_model(Valuefield, :fieldvalue => "testVal", :property_id => property.id)
    product = Product.create(name: "Hello Product", description: "Hello Product Description", code: nil)
    #product = mock_model(Product, :name => "Hello", :description => "Hello There", :code => nil, :categories => [category], :properties => [property], :valuefields => [valuefield])
    category.products = [product]
    product.properties = [property]
    product.valuefields = [valuefield]
    assign(:product, product)
    assign(:product_components, product.components)
    assign(:product_valuefields, product.valuefields)
    assign(:product_properties, product.properties)
    assign(:product_images, product.images)
    assign(:product_datafiles, product.data_files)
    render
    #Check H1 content
    rendered.should have_selector("h1", :content => "Hello Product")
  end
end
