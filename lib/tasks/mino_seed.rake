namespace :app do
  desc <<-DESC
    Load testing data.
    Run using the command 'rake app:load_demo_data'
  DESC
  task :minto_seed => [:environment] do

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

Minto = Category.create(name: "Minto")

################################################################################################################
#Products                                                                                                      #
################################################################################################################


    ###Minto

    ##Block1

    #Front

B1_3D_1F = Product.create(name: "B1_3D_1F", description: "B1_3D_1F", code: "B1_3D_1F")
B1_2B_1F = Product.create(name: "B1_2B_1F", description: "B1_2B_1F", code: "B1_2B_1F")
B1_2B_2F = Product.create(name: "B1_2B_2F", description: "B1_2B_2F", code: "B1_2B_2F")
B1_2B_3F = Product.create(name: "B1_2B_3F", description: "B1_2B_3F", code: "B1_2B_3F")
B1_3C_1F = Product.create(name: "B1_3C_1F", description: "B1_3C_1F", code: "B1_3C_1F")
B1_2E_1F = Product.create(name: "B1_2E_1F", description: "B1_2E_1F", code: "B1_2E_1F")
B1_2F_1F = Product.create(name: "B1_2F_1F", description: "B1_2F_1F", code: "B1_2F_1F")
B1_2A_1F = Product.create(name: "B1_2A_1F", description: "B1_2A_1F", code: "B1_2A_1F")


    #Back
B1_3D_1B = Product.create(name: "B1_3D_1B", description: "B1_3D_1B", code: "B1_3D_1B")
B1_2B_1B = Product.create(name: "B1_2B_1B", description: "B1_2B_1B", code: "B1_2B_1B")
B1_2B_2B = Product.create(name: "B1_2B_2B", description: "B1_2B_2B", code: "B1_2B_2B")
B1_2B_3B = Product.create(name: "B1_2B_3B", description: "B1_2B_3B", code: "B1_2B_3B")
B1_3C_1B = Product.create(name: "B1_3C_1B", description: "B1_3C_1B", code: "B1_3C_1B")
B1_2E_1B = Product.create(name: "B1_2E_1B", description: "B1_2E_1B", code: "B1_2E_1B")
B1_2F_1B = Product.create(name: "B1_2F_1B", description: "B1_2F_1B", code: "B1_2F_1B")
B1_2A_1B = Product.create(name: "B1_2A_1B", description: "B1_2A_1B", code: "B1_2A_1B")


    ##Block2

    #Front
B2_2B_1F = Product.create(name: "B2_2B_1F", description: "B2_2B_1F", code: "B2_2B_1F")
B2_2B_2F = Product.create(name: "B2_2B_2F", description: "B2_2B_2F", code: "B2_2B_2F")
B2_2B_3F = Product.create(name: "B2_2B_3F", description: "B2_2B_3F", code: "B2_2B_3F")
B2_2B_4F = Product.create(name: "B2_2B_4F", description: "B2_2B_4F", code: "B2_2B_4F")
B2_3B_1F = Product.create(name: "B2_3B_1F", description: "B2_3B_1F", code: "B2_3B_1F")
B2_2A_1F = Product.create(name: "B2_2A_1F", description: "B2_2A_1F", code: "B2_2A_1F")
B2_2E_1F = Product.create(name: "B2_2E_1F", description: "B2_2E_1F", code: "B2_2E_1F")
B2_2F_1F = Product.create(name: "B2_2F_1F", description: "B2_2F_1F", code: "B2_2F_1F")
B2_2A_2F = Product.create(name: "B2_2A_2F", description: "B2_2A_2F", code: "B2_2A_2F")
B2_3C_1F = Product.create(name: "B2_3C_1F", description: "B2_3C_1F", code: "B2_3C_1F")


    #Back
B2_2B_1B = Product.create(name: "B2_2B_1B", description: "B2_2B_1B", code: "B2_2B_1B")
B2_2B_2B = Product.create(name: "B2_2B_2B", description: "B2_2B_2B", code: "B2_2B_2B")
B2_2B_3B = Product.create(name: "B2_2B_3B", description: "B2_2B_3B", code: "B2_2B_3B")
B2_2B_4B = Product.create(name: "B2_2B_4B", description: "B2_2B_4B", code: "B2_2B_4B")
B2_3B_1B = Product.create(name: "B2_3B_1B", description: "B2_3B_1B", code: "B2_3B_1B")
B2_2A_1B = Product.create(name: "B2_2A_1B", description: "B2_2A_1B", code: "B2_2A_1B")
B2_2E_1B = Product.create(name: "B2_2E_1B", description: "B2_2E_1B", code: "B2_2E_1B")
B2_2F_1B = Product.create(name: "B2_2F_1B", description: "B2_2F_1B", code: "B2_2F_1B")
B2_2A_2B = Product.create(name: "B2_2A_2B", description: "B2_2A_2B", code: "B2_2A_2B")
B2_3C_1B = Product.create(name: "B2_3C_1B", description: "B2_3C_1B", code: "B2_3C_1B")



    ##Block3

    #Front
B3_2B_1F = Product.create(name: "B3_2B_1F", description: "B3_2B_1F", code: "B3_2B_1F")
B3_2B_2F = Product.create(name: "B3_2B_2F", description: "B3_2B_2F", code: "B3_2B_2F")
B3_2B_3F = Product.create(name: "B3_2B_3F", description: "B3_2B_3F", code: "B3_2B_3F")
B3_2B_4F = Product.create(name: "B3_2B_4F", description: "B3_2B_4F", code: "B3_2B_4F")
B3_2A_1F = Product.create(name: "B3_2A_1F", description: "B3_2A_1F", code: "B3_2A_1F")
B3_2E_1F = Product.create(name: "B3_2E_1F", description: "B3_2E_1F", code: "B3_2E_1F")
B3_2F_1F = Product.create(name: "B3_2F_1F", description: "B3_2F_1F", code: "B3_2F_1F")
B3_2A_2F = Product.create(name: "B3_2A_2F", description: "B3_2A_2F", code: "B3_2A_2F")


    #Back
B3_2B_1B = Product.create(name: "B3_2B_1B", description: "B3_2B_1B", code: "B3_2B_1B")
B3_2B_2B = Product.create(name: "B3_2B_2B", description: "B3_2B_2B", code: "B3_2B_2B")
B3_2B_3B = Product.create(name: "B3_2B_3B", description: "B3_2B_3B", code: "B3_2B_3B")
B3_2B_4B = Product.create(name: "B3_2B_4B", description: "B3_2B_4B", code: "B3_2B_4B")
B3_2A_1B = Product.create(name: "B3_2A_1B", description: "B3_2A_1B", code: "B3_2A_1B")
B3_2E_1B = Product.create(name: "B3_2E_1B", description: "B3_2E_1B", code: "B3_2E_1B")
B3_2F_1B = Product.create(name: "B3_2F_1B", description: "B3_2F_1B", code: "B3_2F_1B")
B3_2A_2B = Product.create(name: "B3_2A_2B", description: "B3_2A_2B", code: "B3_2A_2B")



    ##Block4

    #Front
B4_2B_1F = Product.create(name: "B4_2B_1F", description: "B4_2B_1F", code: "B4_2B_1F")
B4_2B_2F = Product.create(name: "B4_2B_2F", description: "B4_2B_2F", code: "B4_2B_2F")
B4_2B_3F = Product.create(name: "B4_2B_3F", description: "B4_2B_3F", code: "B4_2B_3F")
B4_2B_4F = Product.create(name: "B4_2B_4F", description: "B4_2B_4F", code: "B4_2B_4F")
B4_3B_1F = Product.create(name: "B4_3B_1F", description: "B4_3B_1F", code: "B4_3B_1F")
B4_2A_1F = Product.create(name: "B4_2A_1F", description: "B4_2A_1F", code: "B4_2A_1F")
B4_2E_1F = Product.create(name: "B4_2E_1F", description: "B4_2E_1F", code: "B4_2E_1F")
B4_2F_1F = Product.create(name: "B4_2F_1F", description: "B4_2F_1F", code: "B4_2F_1F")
B4_2A_2F = Product.create(name: "B4_2A_2F", description: "B4_2A_2F", code: "B4_2A_2F")
B4_3C_1F = Product.create(name: "B4_3C_1F", description: "B4_3C_1F", code: "B4_3C_1F")


    #Back
B4_2B_1B = Product.create(name: "B4_2B_1B", description: "B4_2B_1B", code: "B4_2B_1B")
B4_2B_2B = Product.create(name: "B4_2B_2B", description: "B4_2B_2B", code: "B4_2B_2B")
B4_2B_3B = Product.create(name: "B4_2B_3B", description: "B4_2B_3B", code: "B4_2B_3B")
B4_2B_4B = Product.create(name: "B4_2B_4B", description: "B4_2B_4B", code: "B4_2B_4B")
B4_3B_1B = Product.create(name: "B4_3B_1B", description: "B4_3B_1B", code: "B4_3B_1B")
B4_2A_1B = Product.create(name: "B4_2A_1B", description: "B4_2A_1B", code: "B4_2A_1B")
B4_2E_1B = Product.create(name: "B4_2E_1B", description: "B4_2E_1B", code: "B4_2E_1B")
B4_2F_1B = Product.create(name: "B4_2F_1B", description: "B4_2F_1B", code: "B4_2F_1B")
B4_2A_2B = Product.create(name: "B4_2A_2B", description: "B4_2A_2B", code: "B4_2A_2B")
B4_3C_1B = Product.create(name: "B4_3C_1B", description: "B4_3C_1B", code: "B4_3C_1B")

    ###/Minto




################################################################################################################
#Properties                                                                                                    #
################################################################################################################

availability = Property.create(name: "Availability", description: "Suite Availability", field_type: "boolean")
price = Property.create(name: "Price", description: "Suite Price", field_type: "integer")
size = Property.create(name: "Size", description: "Square Foot", field_type: "integer")

################################################################################################################
#ValueFields                                                                                                   #
################################################################################################################

            MintoAvailable = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            MintoUnavailable = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")

            Minto2APrice = Valuefield.create(fieldvalue: "325080", property_id: price.id, code: "")
            Minto2BPrice = Valuefield.create(fieldvalue: "340200", property_id: price.id, code: "")
            Minto2CPrice = Valuefield.create(fieldvalue: "337050", property_id: price.id, code: "")
            Minto2DPrice = Valuefield.create(fieldvalue: "350595", property_id: price.id, code: "")
            Minto2EPrice = Valuefield.create(fieldvalue: "299250", property_id: price.id, code: "")
            Minto2FPrice = Valuefield.create(fieldvalue: "323505", property_id: price.id, code: "")
            Minto3APrice = Valuefield.create(fieldvalue: "478800", property_id: price.id, code: "")
            Minto3BPrice = Valuefield.create(fieldvalue: "482895", property_id: price.id, code: "")
            Minto3CPrice = Valuefield.create(fieldvalue: "457695", property_id: price.id, code: "")
            Minto3DPrice = Valuefield.create(fieldvalue: "478800", property_id: price.id, code: "")


            Minto2ASize = Valuefield.create(fieldvalue: "1032", property_id: size.id, code: "")
            Minto2BSize = Valuefield.create(fieldvalue: "1080", property_id: size.id, code: "")
            Minto2CSize = Valuefield.create(fieldvalue: "1070", property_id: size.id, code: "")
            Minto2DSize = Valuefield.create(fieldvalue: "1113", property_id: size.id, code: "")
            Minto2ESize = Valuefield.create(fieldvalue: "950",  property_id: size.id, code: "")
            Minto2FSize = Valuefield.create(fieldvalue: "1027", property_id: size.id, code: "")
            Minto3ASize = Valuefield.create(fieldvalue: "1520", property_id: size.id, code: "")
            Minto3BSize = Valuefield.create(fieldvalue: "1533", property_id: size.id, code: "")
            Minto3CSize = Valuefield.create(fieldvalue: "1453", property_id: size.id, code: "")
            Minto3DSize = Valuefield.create(fieldvalue: "1520", property_id: size.id, code: "")


################################################################################################################
#Properties_Products - association table                                                                       #
################################################################################################################



    B1_3D_1F.properties = [availability, price, size]
    B1_2B_1F.properties = [availability, price, size]
    B1_2B_2F.properties = [availability, price, size]
    B1_2B_3F.properties = [availability, price, size]
    B1_3C_1F.properties = [availability, price, size]
    B1_2E_1F.properties = [availability, price, size]
    B1_2F_1F.properties = [availability, price, size]
    B1_2A_1F.properties = [availability, price, size]


    #Back

    B1_3D_1B.properties = [availability, price, size]
    B1_2B_1B.properties = [availability, price, size]
    B1_2B_2B.properties = [availability, price, size]
    B1_2B_3B.properties = [availability, price, size]
    B1_3C_1B.properties = [availability, price, size]
    B1_2E_1B.properties = [availability, price, size]
    B1_2F_1B.properties = [availability, price, size]
    B1_2A_1B.properties = [availability, price, size]


    ##Block2

    #Front

    B2_2B_1F.properties = [availability, price, size]
    B2_2B_2F.properties = [availability, price, size]
    B2_2B_3F.properties = [availability, price, size]
    B2_2B_4F.properties = [availability, price, size]
    B2_3B_1F.properties = [availability, price, size]
    B2_2A_1F.properties = [availability, price, size]
    B2_2E_1F.properties = [availability, price, size]
    B2_2F_1F.properties = [availability, price, size]
    B2_2A_2F.properties = [availability, price, size]
    B2_3C_1F.properties = [availability, price, size]


    #Back


    B2_2B_1B.properties = [availability, price, size]
    B2_2B_2B.properties = [availability, price, size]
    B2_2B_3B.properties = [availability, price, size]
    B2_2B_4B.properties = [availability, price, size]
    B2_3B_1B.properties = [availability, price, size]
    B2_2A_1B.properties = [availability, price, size]
    B2_2E_1B.properties = [availability, price, size]
    B2_2F_1B.properties = [availability, price, size]
    B2_2A_2B.properties = [availability, price, size]
    B2_3C_1B.properties = [availability, price, size]



    ##Block3

    #Front

    B3_2B_1F.properties = [availability, price, size]
    B3_2B_2F.properties = [availability, price, size]
    B3_2B_3F.properties = [availability, price, size]
    B3_2B_4F.properties = [availability, price, size]
    B3_2A_1F.properties = [availability, price, size]
    B3_2E_1F.properties = [availability, price, size]
    B3_2F_1F.properties = [availability, price, size]
    B3_2A_2F.properties = [availability, price, size]


    #Back



    B3_2B_1B.properties = [availability, price, size]
    B3_2B_2B.properties = [availability, price, size]
    B3_2B_3B.properties = [availability, price, size]
    B3_2B_4B.properties = [availability, price, size]
    B3_2A_1B.properties = [availability, price, size]
    B3_2E_1B.properties = [availability, price, size]
    B3_2F_1B.properties = [availability, price, size]
    B3_2A_2B.properties = [availability, price, size]



    ##Block4

    #Front

    B4_2B_1F.properties = [availability, price, size]
    B4_2B_2F.properties = [availability, price, size]
    B4_2B_3F.properties = [availability, price, size]
    B4_2B_4F.properties = [availability, price, size]
    B4_3B_1F.properties = [availability, price, size]
    B4_2A_1F.properties = [availability, price, size]
    B4_2E_1F.properties = [availability, price, size]
    B4_2F_1F.properties = [availability, price, size]
    B4_2A_2F.properties = [availability, price, size]
    B4_3C_1F.properties = [availability, price, size]


    #Back


    B4_2B_1B.properties = [availability, price, size]
    B4_2B_2B.properties = [availability, price, size]
    B4_2B_3B.properties = [availability, price, size]
    B4_2B_4B.properties = [availability, price, size]
    B4_3B_1B.properties = [availability, price, size]
    B4_2A_1B.properties = [availability, price, size]
    B4_2E_1B.properties = [availability, price, size]
    B4_2F_1B.properties = [availability, price, size]
    B4_2A_2B.properties = [availability, price, size]
    B4_3C_1B.properties = [availability, price, size]








################################################################################################################
#Valuefields_Products - association table                                                                      #
################################################################################################################


    B1_3D_1F.valuefields = [MintoAvailable,Minto3DPrice, Minto3DSize]
    B1_2B_1F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B1_2B_2F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B1_2B_3F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B1_3C_1F.valuefields = [MintoAvailable,Minto3CPrice, Minto3CSize]
    B1_2E_1F.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize]
    B1_2F_1F.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize]
    B1_2A_1F.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize]


    #Back

    B1_3D_1B.valuefields = [MintoAvailable,Minto3DPrice, Minto3DSize]
    B1_2B_1B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B1_2B_2B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B1_2B_3B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B1_3C_1B.valuefields = [MintoAvailable,Minto3CPrice, Minto3CSize]
    B1_2E_1B.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize]
    B1_2F_1B.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize]
    B1_2A_1B.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize]


    ##Block2

    #Front

    B2_2B_1F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B2_2B_2F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B2_2B_3F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B2_2B_4F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B2_3B_1F.valuefields = [MintoAvailable,Minto3BPrice, Minto3BSize]
    B2_2A_1F.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize]
    B2_2E_1F.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize]
    B2_2F_1F.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize]
    B2_2A_2F.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize]
    B2_3C_1F.valuefields = [MintoAvailable,Minto3CPrice, Minto3CSize]


    #Back


    B2_2B_1B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B2_2B_2B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B2_2B_3B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B2_2B_4B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B2_3B_1B.valuefields = [MintoAvailable,Minto3BPrice, Minto3BSize]
    B2_2A_1B.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize]
    B2_2E_1B.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize]
    B2_2F_1B.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize]
    B2_2A_2B.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize]
    B2_3C_1B.valuefields = [MintoAvailable,Minto3CPrice, Minto3CSize]



    ##Block3

    #Front

    B3_2B_1F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B3_2B_2F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B3_2B_3F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B3_2B_4F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B3_2A_1F.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize]
    B3_2E_1F.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize]
    B3_2F_1F.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize]
    B3_2A_2F.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize]


    #Back



    B3_2B_1B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B3_2B_2B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B3_2B_3B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B3_2B_4B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B3_2A_1B.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize]
    B3_2E_1B.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize]
    B3_2F_1B.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize]
    B3_2A_2B.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize]



    ##Block4

    #Front

    B4_2B_1F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B4_2B_2F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B4_2B_3F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B4_2B_4F.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B4_3B_1F.valuefields = [MintoAvailable,Minto3BPrice, Minto3BSize]
    B4_2A_1F.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize]
    B4_2E_1F.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize]
    B4_2F_1F.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize]
    B4_2A_2F.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize]
    B4_3C_1F.valuefields = [MintoAvailable,Minto3CPrice, Minto3CSize]


    #Back


    B4_2B_1B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B4_2B_2B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B4_2B_3B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B4_2B_4B.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize]
    B4_3B_1B.valuefields = [MintoAvailable,Minto3BPrice, Minto3BSize]
    B4_2A_1B.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize]
    B4_2E_1B.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize]
    B4_2F_1B.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize]
    B4_2A_2B.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize]
    B4_3C_1B.valuefields = [MintoAvailable,Minto3CPrice, Minto3CSize]




################################################################################################################
#Categories_Products - association table                                                                       #
################################################################################################################



    Minto.products = [
            B1_3D_1F,
            B1_2B_1F,
            B1_2B_2F,
            B1_2B_3F,
            B1_3C_1F,
            B1_2E_1F,
            B1_2F_1F,
            B1_2A_1F,


            #Back

            B1_3D_1B,
            B1_2B_1B,
            B1_2B_2B,
            B1_2B_3B,
            B1_3C_1B,
            B1_2E_1B,
            B1_2F_1B,
            B1_2A_1B,


            ##Block2

            #Front

            B2_2B_1F,
            B2_2B_2F,
            B2_2B_3F,
            B2_2B_4F,
            B2_3B_1F,
            B2_2A_1F,
            B2_2E_1F,
            B2_2F_1F,
            B2_2A_2F,
            B2_3C_1F,


            #Back


            B2_2B_1B,
            B2_2B_2B,
            B2_2B_3B,
            B2_2B_4B,
            B2_3B_1B,
            B2_2A_1B,
            B2_2E_1B,
            B2_2F_1B,
            B2_2A_2B,
            B2_3C_1B,



            ##Block3

            #Front

            B3_2B_1F,
            B3_2B_2F,
            B3_2B_3F,
            B3_2B_4F,
            B3_2A_1F,
            B3_2E_1F,
            B3_2F_1F,
            B3_2A_2F,


            #Back



            B3_2B_1B,
            B3_2B_2B,
            B3_2B_3B,
            B3_2B_4B,
            B3_2A_1B,
            B3_2E_1B,
            B3_2F_1B,
            B3_2A_2B,



            ##Block4

            #Front

            B4_2B_1F,
            B4_2B_2F,
            B4_2B_3F,
            B4_2B_4F,
            B4_3B_1F,
            B4_2A_1F,
            B4_2E_1F,
            B4_2F_1F,
            B4_2A_2F,
            B4_3C_1F,


            #Back


            B4_2B_1B,
            B4_2B_2B,
            B4_2B_3B,
            B4_2B_4B,
            B4_3B_1B,
            B4_2A_1B,
            B4_2E_1B,
            B4_2F_1B,
            B4_2A_2B,
            B4_3C_1B]



################################################################################################################
#Table Alias                                                                                                   #
################################################################################################################


################################################################################################################
#All Seating Test                                                                                              #
#End of Seed                                                                                                   #
################################################################################################################

  end
end
