=begin
################################################################################################################
#All Seating Test                                                                                              #
#Begin Seed                                                                                                    #
################################################################################################################
=end

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

=begin
################################################################################################################
#Users                                                                                                         #
################################################################################################################
=end
brett = User.create(username: "bh", email: "bh@bh.com", password: "bh")
graham = User.create(username: "gk", email: "gk@gk.com", password: "gk")

=begin
################################################################################################################
#Validations                                                                                                   #
################################################################################################################
=end
jpg = Validation.create(extension: ".jpg", kind: "Image")
png = Validation.create(extension: ".png", kind: "Image")
gif = Validation.create(extension: ".gif", kind: "Image")
dae = Validation.create(extension: ".DAE", kind: "Data File")
txt = Validation.create(extension: ".txt", kind: "Data File")

=begin
################################################################################################################
#Categories                                                                                                    #
################################################################################################################
=end
all = Category.create(name: "All")
chair = Category.create(name: "Chair", parent_id: all.id)
a1 = Category.create(name: "a1", parent_id: chair.id)

=begin
################################################################################################################
#Products                                                                                                      #
################################################################################################################
=end
p1 = Product.create(name: "Product1", description: "Fluid Basic Stool Chair", code: "82")



=begin
################################################################################################################
#Groups                                                                                                        #
################################################################################################################
=end
#Groups below represent an "or" choice
g1 = Group.create(name: "g1")
g2 = Group.create(name: "g2")
g3 = Group.create(name: "g3")
g4 = Group.create(name: "g4")

=begin
################################################################################################################
#Components                                                                                                    #
################################################################################################################
=end

c1 = Component.create(name: "c1", description: "Chair with No Arm", group_id: g1.id, code: "NA")
c2 = Component.create(name: "c2", description: "Chair with Task 2 Arm", group_id: nil, code: "T2")
c3 = Component.create(name: "c3", description: "Chair with Task 3 Arm", group_id: g1.id, code: "T2")


#properties
prop1 = Property.create(field_type: "", description: "", name: "prop1")

=begin
################################################################################################################
#ValueFields                                                                                                   #
################################################################################################################
=end

v1 = Valuefield.create(fieldvalue: "v1", property_id: prop1.id, code: "")
v2 = Valuefield.create(fieldvalue: "v2", property_id: prop1.id, code: "")





=begin
################################################################################################################
#Categories_Products - association table                                                                       #
################################################################################################################
=end
a1.products = [p1]

=begin
################################################################################################################
#Components_Products - association table                                                                       #
################################################################################################################
=end
p1.components = [c1, c3]

=begin
################################################################################################################
#Components_Components - association table                                                                     #
################################################################################################################
=end
c1.components = [c2]



=begin
################################################################################################################
#Products_Valuefields - association table                                                                       #
################################################################################################################
=end

=begin
################################################################################################################
#Components_Valuefields - association table                                                                       #
################################################################################################################
=end
c1.valuefields = [v1]
c2.valuefields = [v2]




=begin
################################################################################################################
#All Seating Test                                                                                              #
#End of Seed                                                                                                   #
################################################################################################################
=end
