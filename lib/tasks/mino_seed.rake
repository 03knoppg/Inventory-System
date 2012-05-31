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


B1_3D_1F_7 = Product.create(name: "B1_3D_1F_7", description: "B1_3D_1F_7", code: "B1_3D_1F_7")
B1_2Z_1F_2 = Product.create(name: "B1_2B_1F_2", description: "B1_2B_1F_2", code: "B1_2B_1F_2")
B1_2B_1F_3 = Product.create(name: "B1_2B_2F_3", description: "B1_2B_2F_3", code: "B1_2B_2F_3")
B1_2B_2F_6 = Product.create(name: "B1_2B_3F_6", description: "B1_2B_3F_6", code: "B1_2B_3F_6")
B1_3C_1F_8 = Product.create(name: "B1_3C_1F_8", description: "B1_3C_1F_8", code: "B1_3C_1F_8")
B1_2E_1F_5 = Product.create(name: "B1_2E_1F_5", description: "B1_2E_1F_5", code: "B1_2E_1F_5")
B1_2F_1F_4 = Product.create(name: "B1_2F_1F_4", description: "B1_2F_1F_4", code: "B1_2F_1F_4")
B1_2Y_1F_1 = Product.create(name: "B1_2A_1F_1", description: "B1_2A_1F_1", code: "B1_2A_1F_1")


    #Back
B1_3D_1B_10 = Product.create(name: "B1_3D_1B_10", description: "B1_3D_1B_10", code: "B1_3D_1B_10")
B1_2B_1B_11 = Product.create(name: "B1_2B_1B_11", description: "B1_2B_1B_11", code: "B1_2B_1B_11")
B1_2B_2B_14 = Product.create(name: "B1_2B_2B_14", description: "B1_2B_2B_14", code: "B1_2B_2B_14")
B1_2Z_1B_15 = Product.create(name: "B1_2B_3B_15", description: "B1_2B_3B_15", code: "B1_2B_3B_15")
B1_3C_1B_9 = Product.create(name: "B1_3C_1B_9", description: "B1_3C_1B_9", code: "B1_3C_1B_9")
B1_2E_1B_12 = Product.create(name: "B1_2E_1B_12", description: "B1_2E_1B_12", code: "B1_2E_1B_12")
B1_2F_1B_13 = Product.create(name: "B1_2F_1B_13", description: "B1_2F_1B_13", code: "B1_2F_1B_13")
B1_2Y_1B_16 = Product.create(name: "B1_2A_1B_16", description: "B1_2A_1B_16", code: "B1_2A_1B_16")


    ##Block2

    #Front
B2_2B_1F_6 = Product.create(name: "B2_2B_1F_6", description: "B2_2B_1F_6", code: "B2_2B_1F_6")
B2_2B_2F_7 = Product.create(name: "B2_2B_2F_7", description: "B2_2B_2F_7", code: "B2_2B_2F_7")
B2_2B_3F_10 = Product.create(name: "B2_2B_3F_10", description: "B2_2B_3F_10", code: "B2_2B_3F_10")
B2_2Z_1F_11 = Product.create(name: "B2_2B_4F_11", description: "B2_2B_4F_11", code: "B2_2B_4F_11")
B2_3B_1F_2 = Product.create(name: "B2_3B_1F_2", description: "B2_3B_1F_2", code: "B2_3B_1F_2")
B2_2A_1F_5 = Product.create(name: "B2_2A_1F_5", description: "B2_2A_1F_5", code: "B2_2A_1F_5")
B2_2E_1F_9 = Product.create(name: "B2_2E_1F_9", description: "B2_2E_1F_9", code: "B2_2E_1F_9")
B2_2F_1F_8 = Product.create(name: "B2_2F_1F_8", description: "B2_2F_1F_8", code: "B2_2F_1F_8")
B2_2Y_1F_12 = Product.create(name: "B2_2A_2F_12", description: "B2_2A_2F_12", code: "B2_2A_2F_12")
B2_3A_1F_1 = Product.create(name: "B2_3C_1F_1", description: "B2_3C_1F_1", code: "B2_3C_1F_1")


    #Back
B2_2Z_1B_14 = Product.create(name: "B2_2B_1B_14", description: "B2_2B_1B_14", code: "B2_2B_1B_14")
B2_2B_1B_15 = Product.create(name: "B2_2B_2B_15", description: "B2_2B_2B_15", code: "B2_2B_2B_15")
B2_2B_2B_18 = Product.create(name: "B2_2B_3B_18", description: "B2_2B_3B_18", code: "B2_2B_3B_18")
B2_2B_3B_19 = Product.create(name: "B2_2B_4B_19", description: "B2_2B_4B_19", code: "B2_2B_4B_19")
B2_3B_1B_3 = Product.create(name: "B2_3B_1B_3", description: "B2_3B_1B_3", code: "B2_3B_1B_3")
B2_2Y_1B_13 = Product.create(name: "B2_2A_1B_13", description: "B2_2A_1B_13", code: "B2_2A_1B_13")
B2_2E_1B_16 = Product.create(name: "B2_2E_1B_16", description: "B2_2E_1B_16", code: "B2_2E_1B_16")
B2_2F_1B_17 = Product.create(name: "B2_2F_1B_17", description: "B2_2F_1B_17", code: "B2_2F_1B_17")
B2_2A_1B_20 = Product.create(name: "B2_2A_2B_20", description: "B2_2A_2B_20", code: "B2_2A_2B_20")
B2_3A_1B_4 = Product.create(name: "B2_3C_1B_4", description: "B2_3C_1B_4", code: "B2_3C_1B_4")



    ##Block3

    #Front
B3_2Z_1F_2 = Product.create(name: "B3_2B_1F_2", description: "B3_2B_1F_2", code: "B3_2B_1F_2")
B3_2B_1F_3 = Product.create(name: "B3_2B_2F_3", description: "B3_2B_2F_3", code: "B3_2B_2F_3")
B3_2B_2F_6 = Product.create(name: "B3_2B_3F_6", description: "B3_2B_3F_6", code: "B3_2B_3F_6")
B3_2Z_2F_7 = Product.create(name: "B3_2B_4F_7", description: "B3_2B_4F_7", code: "B3_2B_4F_7")
B3_2Y_1F_1 = Product.create(name: "B3_2A_1F_1", description: "B3_2A_1F_1", code: "B3_2A_1F_1")
B3_2E_1F_5 = Product.create(name: "B3_2E_1F_5", description: "B3_2E_1F_5", code: "B3_2E_1F_5")
B3_2F_1F_4 = Product.create(name: "B3_2F_1F_4", description: "B3_2F_1F_4", code: "B3_2F_1F_4")
B3_2Y_2F_8 = Product.create(name: "B3_2A_2F_8", description: "B3_2A_2F_8", code: "B3_2A_2F_8")


    #Back
B3_2Z_1B_10 = Product.create(name: "B3_2B_1B_10", description: "B3_2B_1B_10", code: "B3_2B_1B_10")
B3_2B_1B_11 = Product.create(name: "B3_2B_2B_11", description: "B3_2B_2B_11", code: "B3_2B_2B_11")
B3_2B_2B_14 = Product.create(name: "B3_2B_3B_14", description: "B3_2B_3B_14", code: "B3_2B_3B_14")
B3_2Z_2B_15 = Product.create(name: "B3_2B_4B_15", description: "B3_2B_4B_15", code: "B3_2B_4B_15")
B3_2Y_1B_9 = Product.create(name: "B3_2A_1B_9", description: "B3_2A_1B_9", code: "B3_2A_1B_9")
B3_2E_1B_12 = Product.create(name: "B3_2E_1B_12", description: "B3_2E_1B_12", code: "B3_2E_1B_12")
B3_2F_1B_13 = Product.create(name: "B3_2F_1B_13", description: "B3_2F_1B_13", code: "B3_2F_1B_13")
B3_2Y_2B_16 = Product.create(name: "B3_2A_2B_16", description: "B3_2A_2B_16", code: "B3_2A_2B_16")



    ##Block4

    #Front
B4_2B_1F_6 = Product.create(name: "B4_2B_1F_6", description: "B4_2B_1F_6", code: "B4_2B_1F_6")
B4_2B_2F_7 = Product.create(name: "B4_2B_2F_7", description: "B4_2B_2F_7", code: "B4_2B_2F_7")
B4_2B_3F_10 = Product.create(name: "B4_2B_3F_10", description: "B4_2B_3F_10", code: "B4_2B_3F_10")
B4_2Z_1F_11 = Product.create(name: "B4_2B_4F_11", description: "B4_2B_4F_11", code: "B4_2B_4F_11")
B4_3B_1F_2 = Product.create(name: "B4_3B_1F_2", description: "B4_3B_1F_2", code: "B4_3B_1F_2")
B4_2A_1F_5 = Product.create(name: "B4_2A_1F_5", description: "B4_2A_1F_5", code: "B4_2A_1F_5")
B4_2E_1F_9 = Product.create(name: "B4_2E_1F_9", description: "B4_2E_1F_9", code: "B4_2E_1F_9")
B4_2F_1F_8 = Product.create(name: "B4_2F_1F_8", description: "B4_2F_1F_8", code: "B4_2F_1F_8")
B4_2Y_1F_12 = Product.create(name: "B4_2A_2F_12", description: "B4_2A_2F_12", code: "B4_2A_2F_12")
B4_3A_1F_1 = Product.create(name: "B4_3C_1F_1", description: "B4_3C_1F_1", code: "B4_3C_1F_1")


    #Back
B4_2Z_1B_14 = Product.create(name: "B4_2B_1B_14", description: "B4_2B_1B_14", code: "B4_2B_1B_14")
B4_2B_1B_15 = Product.create(name: "B4_2B_2B_15", description: "B4_2B_2B_15", code: "B4_2B_2B_15")
B4_2B_2B_18 = Product.create(name: "B4_2B_3B_18", description: "B4_2B_3B_18", code: "B4_2B_3B_18")
B4_2B_3B_19 = Product.create(name: "B4_2B_4B_19", description: "B4_2B_4B_19", code: "B4_2B_4B_19")
B4_3B_1B_3 = Product.create(name: "B4_3B_1B_3", description: "B4_3B_1B_3", code: "B4_3B_1B_3")
B4_2Y_1B_13 = Product.create(name: "B4_2A_1B_13", description: "B4_2A_1B_13", code: "B4_2A_1B_13")
B4_2E_1B_16 = Product.create(name: "B4_2E_1B_16", description: "B4_2E_1B_16", code: "B4_2E_1B_16")
B4_2F_1B_17 = Product.create(name: "B4_2F_1B_17", description: "B4_2F_1B_17", code: "B4_2F_1B_17")
B4_2A_1B_20 = Product.create(name: "B4_2A_2B_20", description: "B4_2A_2B_20", code: "B4_2A_2B_20")
B4_3A_1B_4 = Product.create(name: "B4_3C_1B_4", description: "B4_3C_1B_4", code: "B4_3C_1B_4")

    ###/Minto




################################################################################################################
#Properties                                                                                                    #
################################################################################################################

availability = Property.create(name: "Availability", description: "Suite Availability", field_type: "boolean")
price = Property.create(name: "Price", description: "Suite Price", field_type: "integer")
size = Property.create(name: "Size", description: "Square Foot", field_type: "integer")
premium = Property.create(name: "Premium", description: "Special thing", field_type: "String")

################################################################################################################
#ValueFields                                                                                                   #
################################################################################################################

            MintoAvailable = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            MintoUnavailable = Valuefield.create(fieldvalue: "false", property_id: availability.id, code: "")

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

    
            Minto2APremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto2BPremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto2CPremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto2DPremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto2EPremium = Valuefield.create(fieldvalue: "none",  property_id: premium.id, code: "")
            Minto2FPremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto3APremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto3BPremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto3CPremium = Valuefield.create(fieldvalue: "Test Premuim", property_id: premium.id, code: "")
            Minto3DPremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")


################################################################################################################
#Properties_Products - association table                                                                       #
################################################################################################################



    B1_3D_1F_7.properties = [availability, price, size, premium]
    B1_2Z_1F_2.properties = [availability, price, size, premium]
    B1_2B_1F_3.properties = [availability, price, size, premium]
    B1_2B_2F_6.properties = [availability, price, size, premium]
    B1_3C_1F_8.properties = [availability, price, size, premium]
    B1_2E_1F_5.properties = [availability, price, size, premium]
    B1_2F_1F_4.properties = [availability, price, size, premium]
    B1_2Y_1F_1.properties = [availability, price, size, premium]


    #Back

    B1_3D_1B_10.properties = [availability, price, size, premium]
    B1_2B_1B_11.properties = [availability, price, size, premium]
    B1_2B_2B_14.properties = [availability, price, size, premium]
    B1_2Z_1B_15.properties = [availability, price, size, premium]
    B1_3C_1B_9.properties = [availability, price, size, premium]
    B1_2E_1B_12.properties = [availability, price, size, premium]
    B1_2F_1B_13.properties = [availability, price, size, premium]
    B1_2Y_1B_16.properties = [availability, price, size, premium]


    ##Block2

    #Front

    B2_2B_1F_6.properties = [availability, price, size, premium]
    B2_2B_2F_7.properties = [availability, price, size, premium]
    B2_2B_3F_10.properties = [availability, price, size, premium]
    B2_2Z_1F_11.properties = [availability, price, size, premium]
    B2_3B_1F_2.properties = [availability, price, size, premium]
    B2_2A_1F_5.properties = [availability, price, size, premium]
    B2_2E_1F_9.properties = [availability, price, size, premium]
    B2_2F_1F_8.properties = [availability, price, size, premium]
    B2_2Y_1F_12.properties = [availability, price, size, premium]
    B2_3A_1F_1.properties = [availability, price, size, premium]


    #Back


    B2_2Z_1B_14.properties = [availability, price, size, premium]
    B2_2B_1B_15.properties = [availability, price, size, premium]
    B2_2B_2B_18.properties = [availability, price, size, premium]
    B2_2B_3B_19.properties = [availability, price, size, premium]
    B2_3B_1B_3.properties = [availability, price, size, premium]
    B2_2Y_1B_13.properties = [availability, price, size, premium]
    B2_2E_1B_16.properties = [availability, price, size, premium]
    B2_2F_1B_17.properties = [availability, price, size, premium]
    B2_2A_1B_20.properties = [availability, price, size, premium]
    B2_3A_1B_4.properties = [availability, price, size, premium]



    ##Block3

    #Front

    B3_2Z_1F_2.properties = [availability, price, size, premium]
    B3_2B_1F_3.properties = [availability, price, size, premium]
    B3_2B_2F_6.properties = [availability, price, size, premium]
    B3_2Z_2F_7.properties = [availability, price, size, premium]
    B3_2Y_1F_1.properties = [availability, price, size, premium]
    B3_2E_1F_5.properties = [availability, price, size, premium]
    B3_2F_1F_4.properties = [availability, price, size, premium]
    B3_2Y_2F_8.properties = [availability, price, size, premium]


    #Back

    B3_2Z_1B_10.properties = [availability, price, size, premium]
    B3_2B_1B_11.properties = [availability, price, size, premium]
    B3_2B_2B_14.properties = [availability, price, size, premium]
    B3_2Z_2B_15.properties = [availability, price, size, premium]
    B3_2Y_1B_9.properties = [availability, price, size, premium]
    B3_2E_1B_12.properties = [availability, price, size, premium]
    B3_2F_1B_13.properties = [availability, price, size, premium]
    B3_2Y_2B_16.properties = [availability, price, size, premium]



    ##Block4

    #Front

    B4_2B_1F_6.properties = [availability, price, size, premium]
    B4_2B_2F_7.properties = [availability, price, size, premium]
    B4_2B_3F_10.properties = [availability, price, size, premium]
    B4_2Z_1F_11.properties = [availability, price, size, premium]
    B4_3B_1F_2.properties = [availability, price, size, premium]
    B4_2A_1F_5.properties = [availability, price, size, premium]
    B4_2E_1F_9.properties = [availability, price, size, premium]
    B4_2F_1F_8.properties = [availability, price, size, premium]
    B4_2Y_1F_12.properties = [availability, price, size, premium]
    B4_3A_1F_1.properties = [availability, price, size, premium]


    #Back


    B4_2Z_1B_14.properties = [availability, price, size, premium]
    B4_2B_1B_15.properties = [availability, price, size, premium]
    B4_2B_2B_18.properties = [availability, price, size, premium]
    B4_2B_3B_19.properties = [availability, price, size, premium]
    B4_3B_1B_3.properties = [availability, price, size, premium]
    B4_2Y_1B_13.properties = [availability, price, size, premium]
    B4_2E_1B_16.properties = [availability, price, size, premium]
    B4_2F_1B_17.properties = [availability, price, size, premium]
    B4_2A_1B_20.properties = [availability, price, size, premium]
    B4_3A_1B_4.properties = [availability, price, size, premium]








################################################################################################################
#Valuefields_Products - association table                                                                      #
################################################################################################################


    B1_3D_1F_7.valuefields = [MintoAvailable,Minto3DPrice, Minto3DSize, Minto3DPremium]
    B1_2Z_1F_2.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B1_2B_1F_3.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B1_2B_2F_6.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B1_3C_1F_8.valuefields = [MintoAvailable,Minto3CPrice, Minto3CSize, Minto3CPremium]
    B1_2E_1F_5.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize, Minto2EPremium]
    B1_2F_1F_4.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize, Minto2FPremium]
    B1_2Y_1F_1.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize, Minto2APremium]


    #Back

    B1_3D_1B_10.valuefields = [MintoAvailable,Minto3DPrice, Minto3DSize, Minto3DPremium]
    B1_2B_1B_11.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B1_2B_2B_14.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B1_2Z_1B_15.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B1_3C_1B_9.valuefields = [MintoAvailable,Minto3CPrice, Minto3CSize, Minto3CPremium]
    B1_2E_1B_12.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize, Minto2EPremium]
    B1_2F_1B_13.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize, Minto2FPremium]
    B1_2Y_1B_16.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize, Minto2APremium]


    ##Block2

    #Front

    B2_2B_1F_6.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B2_2B_2F_7.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B2_2B_3F_10.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B2_2Z_1F_11.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B2_3B_1F_2.valuefields = [MintoAvailable,Minto3BPrice, Minto3BSize, Minto3BPremium]
    B2_2A_1F_5.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize, Minto2APremium]
    B2_2E_1F_9.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize, Minto2EPremium]
    B2_2F_1F_8.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize, Minto2FPremium]
    B2_2Y_1F_12.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize, Minto2APremium]
    B2_3A_1F_1.valuefields = [MintoAvailable,Minto3CPrice, Minto3CSize, Minto3CPremium]


    #Back


    B2_2Z_1B_14.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B2_2B_1B_15.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B2_2B_2B_18.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B2_2B_3B_19.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B2_3B_1B_3.valuefields = [MintoAvailable,Minto3BPrice, Minto3BSize, Minto3BPremium]
    B2_2Y_1B_13.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize, Minto2APremium]
    B2_2E_1B_16.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize, Minto2EPremium]
    B2_2F_1B_17.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize, Minto2FPremium]
    B2_2A_1B_20.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize, Minto2APremium]
    B2_3A_1B_4.valuefields = [MintoAvailable,Minto3CPrice, Minto3CSize, Minto3CPremium]



    ##Block3

    #Front

    B3_2Z_1F_2.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B3_2B_1F_3.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B3_2B_2F_6.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B3_2Z_2F_7.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B3_2Y_1F_1.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize, Minto2APremium]
    B3_2E_1F_5.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize, Minto2EPremium]
    B3_2F_1F_4.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize, Minto2FPremium]
    B3_2Y_2F_8.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize, Minto2APremium]


    #Back



    B3_2Z_1B_10.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B3_2B_1B_11.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B3_2B_2B_14.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B3_2Z_2B_15.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B3_2Y_1B_9.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize, Minto2APremium]
    B3_2E_1B_12.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize, Minto2EPremium]
    B3_2F_1B_13.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize, Minto2FPremium]
    B3_2Y_2B_16.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize, Minto2APremium]



    ##Block4

    #Front

    B4_2B_1F_6.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B4_2B_2F_7.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B4_2B_3F_10.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B4_2Z_1F_11.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B4_3B_1F_2.valuefields = [MintoAvailable,Minto3BPrice, Minto3BSize, Minto3BPremium]
    B4_2A_1F_5.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize, Minto2APremium]
    B4_2E_1F_9.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize, Minto2EPremium]
    B4_2F_1F_8.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize, Minto2FPremium]
    B4_2Y_1F_12.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize, Minto2APremium]
    B4_3A_1F_1.valuefields = [MintoAvailable,Minto3CPrice, Minto3CSize, Minto3CPremium]


    #Back


    B4_2Z_1B_14.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B4_2B_1B_15.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B4_2B_2B_18.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B4_2B_3B_19.valuefields = [MintoAvailable,Minto2BPrice, Minto2BSize, Minto2BPremium]
    B4_3B_1B_3.valuefields = [MintoAvailable,Minto3BPrice, Minto3BSize, Minto3BPremium]
    B4_2Y_1B_13.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize, Minto2APremium]
    B4_2E_1B_16.valuefields = [MintoAvailable,Minto2EPrice, Minto2ESize, Minto2EPremium]
    B4_2F_1B_17.valuefields = [MintoAvailable,Minto2FPrice, Minto2FSize, Minto2FPremium]
    B4_2A_1B_20.valuefields = [MintoAvailable,Minto2APrice, Minto2ASize, Minto2APremium]
    B4_3A_1B_4.valuefields = [MintoAvailable,Minto3CPrice, Minto3CSize, Minto3CPremium]




################################################################################################################
#Categories_Products - association table                                                                       #
################################################################################################################



    Minto.products = [

            ##Block1

            #Front

            B1_3D_1F_7,
            B1_2Z_1F_2,
            B1_2B_1F_3,
            B1_2B_2F_6,
            B1_3C_1F_8,
            B1_2E_1F_5,
            B1_2F_1F_4,
            B1_2Y_1F_1,


            #Back

            B1_3D_1B_10,
            B1_2B_1B_11,
            B1_2B_2B_14,
            B1_2Z_1B_15,
            B1_3C_1B_9,
            B1_2E_1B_12,
            B1_2F_1B_13,
            B1_2Y_1B_16,


            ##Block2

            #Front

            B2_2B_1F_6,
            B2_2B_2F_7,
            B2_2B_3F_10,
            B2_2Z_1F_11,
            B2_3B_1F_2,
            B2_2A_1F_5,
            B2_2E_1F_9,
            B2_2F_1F_8,
            B2_2Y_1F_12,
            B2_3A_1F_1,


            #Back


            B2_2Z_1B_14,
            B2_2B_1B_15,
            B2_2B_2B_18,
            B2_2B_3B_19,
            B2_3B_1B_3,
            B2_2Y_1B_13,
            B2_2E_1B_16,
            B2_2F_1B_17,
            B2_2A_1B_20,
            B2_3A_1B_4,



            ##Block3

            #Front

            B3_2Z_1F_2,
            B3_2B_1F_3,
            B3_2B_2F_6,
            B3_2Z_2F_7,
            B3_2Y_1F_1,
            B3_2E_1F_5,
            B3_2F_1F_4,
            B3_2Y_2F_8,


            #Back



            B3_2Z_1B_10,
            B3_2B_1B_11,
            B3_2B_2B_14,
            B3_2Z_2B_15,
            B3_2Y_1B_9,
            B3_2E_1B_12,
            B3_2F_1B_13,
            B3_2Y_2B_16,



            ##Block4

            #Front

            B4_2B_1F_6,
            B4_2B_2F_7,
            B4_2B_3F_10,
            B4_2Z_1F_11,
            B4_3B_1F_2,
            B4_2A_1F_5,
            B4_2E_1F_9,
            B4_2F_1F_8,
            B4_2Y_1F_12,
            B4_3A_1F_1,


            #Back


            B4_2Z_1B_14,
            B4_2B_1B_15,
            B4_2B_2B_18,
            B4_2B_3B_19,
            B4_3B_1B_3,
            B4_2Y_1B_13,
            B4_2E_1B_16,
            B4_2F_1B_17,
            B4_2A_1B_20,
            B4_3A_1B_4]



################################################################################################################
#Table Alias                                                                                                   #
################################################################################################################


################################################################################################################
#All Seating Test                                                                                              #
#End of Seed                                                                                                   #
################################################################################################################

  end
end
