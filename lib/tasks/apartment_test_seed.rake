namespace :app do
  desc <<-DESC
    Load testing data.
    Run using the command 'rake app:load_demo_data'
  DESC
  task :apartment_test_seed => [:environment] do

AppRoot = File.expand_path("~/public_html/3didata")

  # Only data not required in production should be here.
  # If it needs to be there in production, it belongs in seeds.rb.


################################################################################################################
#All Seating Test                                                                                              #
#Begin Seed                                                                                                    #
################################################################################################################


#Destroy Tables
Category.destroy_all
Product.destroy_all
Property.destroy_all
Valuefield.destroy_all
Component.destroy_all
Group.destroy_all
User.destroy_all
Image.destroy_all
DataFile.destroy_all
Validation.destroy_all
TableAlias.destroy_all
Updaterecord.destroy_all


################################################################################################################
#Users                                                                                                         #
################################################################################################################

brett = User.create(username: "bh", email: "bh@bh.com", password: "bh")
graham = User.create(username: "gk", email: "gk@gk.com", password: "gk")


################################################################################################################
#Validations                                                                                                   #
################################################################################################################

jpg = Validation.create(extension: ".jpg", kind: "Image")
png = Validation.create(extension: ".png", kind: "Image")
gif = Validation.create(extension: ".gif", kind: "Image")
dae = Validation.create(extension: ".DAE", kind: "Data File")
txt = Validation.create(extension: ".txt", kind: "Data File")


################################################################################################################
#Categories                                                                                                    #
################################################################################################################

buildingA = Category.create(name: "Building A")

################################################################################################################
#Products                                                                                                      #
################################################################################################################

suite501 = Product.create(name: "Suite 501", description: "Building A 5th Floor Suite", code: "FL_5_Bamboo")
suite502 = Product.create(name: "Suite 502", description: "Building A 5th Floor Suite", code: "FL_5_Burnet")
suite503 = Product.create(name: "Suite 503", description: "Building A 5th Floor Suite", code: "FL_5_Cherry")
suite504 = Product.create(name: "Suite 504", description: "Building A 5th Floor Suite", code: "FL_5_Cypress")
suite505 = Product.create(name: "Suite 505", description: "Building A 5th Floor Suite", code: "FL_5_Ginkgo_A")
suite506 = Product.create(name: "Suite 506", description: "Building A 5th Floor Suite", code: "FL_5_Ginkgo_B")
suite507 = Product.create(name: "Suite 507", description: "Building A 5th Floor Suite", code: "FL_5_Peony")
suite508 = Product.create(name: "Suite 508", description: "Building A 5th Floor Suite", code: "FL_5_Plum_A")
suite509 = Product.create(name: "Suite 509", description: "Building A 5th Floor Suite", code: "FL_5_Plum_B")
suite510 = Product.create(name: "Suite 510", description: "Building A 5th Floor Suite", code: "FL_5_Redwood")
suite511 = Product.create(name: "Suite 511", description: "Building A 5th Floor Suite", code: "FL_5_Spruce")

################################################################################################################
#Properties                                                                                                    #
################################################################################################################

availability = Property.create(name: "Availability", description: "Suite Availability", field_type: "boolean")

################################################################################################################
#ValueFields                                                                                                   #
################################################################################################################

suite501False = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Bamboo")
suite502True = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Burnet")
suite503True = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Cherry")
suite504False = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Cypress")
suite505True = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Ginkgo_A")
suite506True = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Ginkgo_B")
suite507False = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Peony")
suite508True = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Plum_A")
suite509True = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Plum_B")
suite510False = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Redwood")
suite511True = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Spruce")

################################################################################################################
#Properties_Products - association table                                                                       #
################################################################################################################

suite501.properties = [availability]
suite502.properties = [availability]
suite503.properties = [availability]
suite504.properties = [availability]
suite505.properties = [availability]
suite506.properties = [availability]
suite507.properties = [availability]
suite508.properties = [availability]
suite509.properties = [availability]
suite510.properties = [availability]
suite511.properties = [availability]

################################################################################################################
#Valuefields_Products - association table                                                                      #
################################################################################################################

suite501.valuefields = [suite501False]
suite502.valuefields = [suite502True]
suite503.valuefields = [suite503True]
suite504.valuefields = [suite504False]
suite505.valuefields = [suite505True]
suite506.valuefields = [suite506True]
suite507.valuefields = [suite507False]
suite508.valuefields = [suite508True]
suite509.valuefields = [suite509True]
suite510.valuefields = [suite510False]
suite511.valuefields = [suite511True]

################################################################################################################
#Categories_Products - association table                                                                       #
################################################################################################################

buildingA.products = [suite501, suite502, suite503, suite504, suite505, suite506, suite507, suite508, suite509, suite510, suite511]

################################################################################################################
#Table Alias                                                                                                   #
################################################################################################################

catAlias = TableAlias.create(tableName: "categories", aliasName: "Buildings")
grpAlias = TableAlias.create(tableName: "groups", aliasName: "Groups")
propAlias = TableAlias.create(tableName: "properties", aliasName: "Properties")
prodAlias = TableAlias.create(tableName: "products", aliasName: "Suites")
compAlias = TableAlias.create(tableName: "components", aliasName: "Rooms")
vfAlias = TableAlias.create(tableName: "valuefields", aliasName: "Value Fields")
imgAlias = TableAlias.create(tableName: "images", aliasName: "Images")
dfAlias = TableAlias.create(tableName: "data_files", aliasName: "Data Files")
valAlias = TableAlias.create(tableName: "validations", aliasName: "Validations")

################################################################################################################
#All Seating Test                                                                                              #
#End of Seed                                                                                                   #
################################################################################################################
  end
end