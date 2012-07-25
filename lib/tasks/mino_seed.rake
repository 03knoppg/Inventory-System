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
B1_2Z_1F_2 = Product.create(name: "B1_2Z_1F_2", description: "B1_2Z_1F_2", code: "B1_2Z_1F_2")
B1_2B_1F_3 = Product.create(name: "B1_2B_1F_3", description: "B1_2B_1F_3", code: "B1_2B_1F_3")
B1_2B_2F_6 = Product.create(name: "B1_2B_2F_6", description: "B1_2B_2F_6", code: "B1_2B_2F_6")
B1_3C_1F_8 = Product.create(name: "B1_3C_1F_8", description: "B1_3C_1F_8", code: "B1_3C_1F_8")
B1_2E_1F_5 = Product.create(name: "B1_2E_1F_5", description: "B1_2E_1F_5", code: "B1_2E_1F_5")
B1_2F_1F_4 = Product.create(name: "B1_2F_1F_4", description: "B1_2F_1F_4", code: "B1_2F_1F_4")
B1_2Y_1F_1 = Product.create(name: "B1_2Y_1F_1", description: "B1_2Y_1F_1", code: "B1_2Y_1F_1")


    #Back
B1_3D_1B_10 = Product.create(name: "B1_3D_1B_10", description: "B1_3D_1B_10", code: "B1_3D_1B_10")
B1_2B_1B_11 = Product.create(name: "B1_2B_1B_11", description: "B1_2B_1B_11", code: "B1_2B_1B_11")
B1_2B_2B_14 = Product.create(name: "B1_2B_2B_14", description: "B1_2B_2B_14", code: "B1_2B_2B_14")
B1_2Z_1B_15 = Product.create(name: "B1_2Z_1B_15", description: "B1_2Z_1B_15", code: "B1_2Z_1B_15")
B1_3C_1B_9 = Product.create(name: "B1_3C_1B_9", description: "B1_3C_1B_9", code: "B1_3C_1B_9")
B1_2E_1B_12 = Product.create(name: "B1_2E_1B_12", description: "B1_2E_1B_12", code: "B1_2E_1B_12")
B1_2F_1B_13 = Product.create(name: "B1_2F_1B_13", description: "B1_2F_1B_13", code: "B1_2F_1B_13")
B1_2Y_1B_16 = Product.create(name: "B1_2Y_1B_16", description: "B1_2Y_1B_16", code: "B1_2Y_1B_16")


    ##Block2

    #Front
B2_2B_1F_6 = Product.create(name: "B2_2B_1F_6", description: "B2_2B_1F_6", code: "B2_2B_1F_6")
B2_2B_2F_7 = Product.create(name: "B2_2B_2F_7", description: "B2_2B_2F_7", code: "B2_2B_2F_7")
B2_2B_3F_10 = Product.create(name: "B2_2B_3F_10", description: "B2_2B_3F_10", code: "B2_2B_3F_10")
B2_2Z_1F_11 = Product.create(name: "B2_2Z_1F_11", description: "B2_2Z_1F_11", code: "B2_2Z_1F_11")
B2_3B_1F_2 = Product.create(name: "B2_3B_1F_2", description: "B2_3B_1F_2", code: "B2_3B_1F_2")
B2_2A_1F_5 = Product.create(name: "B2_2A_1F_5", description: "B2_2A_1F_5", code: "B2_2A_1F_5")
B2_2E_1F_9 = Product.create(name: "B2_2E_1F_9", description: "B2_2E_1F_9", code: "B2_2E_1F_9")
B2_2F_1F_8 = Product.create(name: "B2_2F_1F_8", description: "B2_2F_1F_8", code: "B2_2F_1F_8")
B2_2Y_1F_12 = Product.create(name: "B2_2Y_1F_12", description: "B2_2Y_1F_12", code: "B2_2Y_1F_12")
B2_3A_1F_1 = Product.create(name: "B2_3A_1F_1", description: "B2_3A_1F_1", code: "B2_3A_1F_1")


    #Back
B2_2Z_1B_14 = Product.create(name: "B2_2Z_1B_14", description: "B2_2Z_1B_14", code: "B2_2Z_1B_14")
B2_2B_1B_15 = Product.create(name: "B2_2B_1B_15", description: "B2_2B_1B_15", code: "B2_2B_1B_15")
B2_2B_2B_18 = Product.create(name: "B2_2B_2B_18", description: "B2_2B_2B_18", code: "B2_2B_2B_18")
B2_2B_3B_19 = Product.create(name: "B2_2B_3B_19", description: "B2_2B_3B_19", code: "B2_2B_3B_19")
B2_3B_1B_3 = Product.create(name: "B2_3B_1B_3", description: "B2_3B_1B_3", code: "B2_3B_1B_3")
B2_2Y_1B_13 = Product.create(name: "B2_2Y_1B_13", description: "B2_2Y_1B_13", code: "B2_2Y_1B_13")
B2_2E_1B_16 = Product.create(name: "B2_2E_1B_16", description: "B2_2E_1B_16", code: "B2_2E_1B_16")
B2_2F_1B_17 = Product.create(name: "B2_2F_1B_17", description: "B2_2F_1B_17", code: "B2_2F_1B_17")
B2_2A_1B_20 = Product.create(name: "B2_2A_1B_20", description: "B2_2A_1B_20", code: "B2_2A_1B_20")
B2_3A_1B_4 = Product.create(name: "B2_3A_1B_4", description: "B2_3A_1B_4", code: "B2_3A_1B_4")



    ##Block3

    #Front
B3_2Z_1F_2 = Product.create(name: "B3_2Z_1F_2", description: "B3_2Z_1F_2", code: "B3_2Z_1F_2")
B3_2B_1F_3 = Product.create(name: "B3_2B_1F_3", description: "B3_2B_1F_3", code: "B3_2B_1F_3")
B3_2B_2F_6 = Product.create(name: "B3_2B_2F_6", description: "B3_2B_2F_6", code: "B3_2B_2F_6")
B3_2Z_2F_7 = Product.create(name: "B3_2Z_2F_7", description: "B3_2Z_2F_7", code: "B3_2Z_2F_7")
B3_2Y_1F_1 = Product.create(name: "B3_2Y_1F_1", description: "B3_2Y_1F_1", code: "B3_2Y_1F_1")
B3_2E_1F_5 = Product.create(name: "B3_2E_1F_5", description: "B3_2E_1F_5", code: "B3_2E_1F_5")
B3_2F_1F_4 = Product.create(name: "B3_2F_1F_4", description: "B3_2F_1F_4", code: "B3_2F_1F_4")
B3_2Y_2F_8 = Product.create(name: "B3_2Y_2F_8", description: "B3_2Y_2F_8", code: "B3_2Y_2F_8")


    #Back
B3_2Z_1B_10 = Product.create(name: "B3_2Z_1B_10", description: "B3_2Z_1B_10", code: "B3_2Z_1B_10")
B3_2B_1B_11 = Product.create(name: "B3_2B_1B_11", description: "B3_2B_1B_11", code: "B3_2B_1B_11")
B3_2B_2B_14 = Product.create(name: "B3_2B_2B_14", description: "B3_2B_2B_14", code: "B3_2B_2B_14")
B3_2Z_2B_15 = Product.create(name: "B3_2Z_2B_15", description: "B3_2Z_2B_15", code: "B3_2Z_2B_15")
B3_2Y_1B_9 = Product.create(name: "B3_2Y_1B_9", description: "B3_2Y_1B_9", code: "B3_2Y_1B_9")
B3_2E_1B_12 = Product.create(name: "B3_2E_1B_12", description: "B3_2E_1B_12", code: "B3_2E_1B_12")
B3_2F_1B_13 = Product.create(name: "B3_2F_1B_13", description: "B3_2F_1B_13", code: "B3_2F_1B_13")
B3_2Y_2B_16 = Product.create(name: "B3_2Y_2B_16", description: "B3_2Y_2B_16", code: "B3_2Y_2B_16")



    ##Block4

    #Front
B4_2B_1F_6 = Product.create(name: "B4_2B_1F_6", description: "B4_2B_1F_6", code: "B4_2B_1F_6")
B4_2B_2F_7 = Product.create(name: "B4_2B_2F_7", description: "B4_2B_2F_7", code: "B4_2B_2F_7")
B4_2B_3F_10 = Product.create(name: "B4_2B_3F_10", description: "B4_2B_3F_10", code: "B4_2B_3F_10")
B4_2Z_1F_11 = Product.create(name: "B4_2Z_1F_11", description: "B4_2Z_1F_11", code: "B4_2Z_1F_11")
B4_3B_1F_2 = Product.create(name: "B4_3B_1F_2", description: "B4_3B_1F_2", code: "B4_3B_1F_2")
B4_2A_1F_5 = Product.create(name: "B4_2A_1F_5", description: "B4_2A_1F_5", code: "B4_2A_1F_5")
B4_2E_1F_9 = Product.create(name: "B4_2E_1F_9", description: "B4_2E_1F_9", code: "B4_2E_1F_9")
B4_2F_1F_8 = Product.create(name: "B4_2F_1F_8", description: "B4_2F_1F_8", code: "B4_2F_1F_8")
B4_2Y_1F_12 = Product.create(name: "B4_2Y_1F_12", description: "B4_2Y_1F_12", code: "B4_2Y_1F_12")
B4_3A_1F_1 = Product.create(name: "B4_3A_1F_1", description: "B4_3A_1F_1", code: "B4_3A_1F_1")


    #Back
B4_2Z_1B_14 = Product.create(name: "B4_2Z_1B_14", description: "B4_2Z_1B_14", code: "B4_2Z_1B_14")
B4_2B_1B_15 = Product.create(name: "B4_2B_1B_15", description: "B4_2B_1B_15", code: "B4_2B_1B_15")
B4_2B_2B_18 = Product.create(name: "B4_2B_2B_18", description: "B4_2B_2B_18", code: "B4_2B_2B_18")
B4_2B_3B_19 = Product.create(name: "B4_2B_3B_19", description: "B4_2B_3B_19", code: "B4_2B_3B_19")
B4_3B_1B_3 = Product.create(name: "B4_3B_1B_3", description: "B4_3B_1B_3", code: "B4_3B_1B_3")
B4_2Y_1B_13 = Product.create(name: "B4_2Y_1B_13", description: "B4_2Y_1B_13", code: "B4_2Y_1B_13")
B4_2E_1B_16 = Product.create(name: "B4_2E_1B_16", description: "B4_2E_1B_16", code: "B4_2E_1B_16")
B4_2F_1B_17 = Product.create(name: "B4_2F_1B_17", description: "B4_2F_1B_17", code: "B4_2F_1B_17")
B4_2A_1B_20 = Product.create(name: "B4_2A_1B_20", description: "B4_2A_1B_20", code: "B4_2A_1B_20")
B4_3A_1B_4 = Product.create(name: "B4_3A_1B_4", description: "B4_3A_1B_4", code: "B4_3A_1B_4")

    
    
    

    ##Block5

    #Front
B5_2Z_1F_17 = Product.create(name: "B5_2Z_1F_17", description: "B5_2Z_1F_17", code: "B5_2Z_1F_17")
B5_2B_1F_6 = Product.create(name: "B5_2B_1F_6", description: "B5_2B_1F_6", code: "B5_2B_1F_6")
B5_2B_2F_7 = Product.create(name: "B5_2B_2F_7", description: "B5_2B_2F_7", code: "B5_2B_2F_7")
B5_2B_3F_10 = Product.create(name: "B5_2B_3F_10", description: "B5_2B_3F_10", code: "B5_2B_3F_10")
B5_2B_4F_11 = Product.create(name: "B5_2B_4F_11", description: "B5_2B_4F_11", code: "B5_2B_4F_11")
B5_2B_5F_14 = Product.create(name: "B5_2B_5F_14", description: "B5_2B_5F_14", code: "B5_2B_5F_14")
B5_2B_6F_15 = Product.create(name: "B5_2B_6F_15", description: "B5_2B_6F_15", code: "B5_2B_6F_15")
B5_3B_1F_3 = Product.create(name: "B5_3B_1F_3", description: "B5_3B_1F_3", code: "B5_3B_1F_3")
    
    
B5_2Y_1F_18 = Product.create(name: "B5_2Y_1F_18", description: "B5_2Y_1F_18", code: "B5_2Y_1F_18")
B5_2A_1F_5 = Product.create(name: "B5_2A_1F_5", description: "B5_2A_1F_5", code: "B5_2A_1F_5")
B5_2E_1F_9 = Product.create(name: "B5_2E_1F_9", description: "B5_2E_1F_9", code: "B5_2E_1F_9")
B5_2F_1F_8 = Product.create(name: "B5_2F_1F_8", description: "B5_2F_1F_8", code: "B5_2F_1F_8")
B5_2E_2F_13 = Product.create(name: "B5_2E_2F_13", description: "B5_2E_2F_13", code: "B5_2E_2F_13")
B5_2F_2F_12 = Product.create(name: "B5_2F_2F_12", description: "B5_2F_2F_12", code: "B5_2F_2F_12")  
B5_2A_2F_16 = Product.create(name: "B5_2A_2F_16", description: "B5_2A_2F_16", code: "B5_2A_2F_16")
B5_3A_1F_4 = Product.create(name: "B5_3A_1F_4", description: "B5_3A_1F_4", code: "B5_3A_1F_4")
    
    
    

    #Back

    
B5_2Z_1B_20 = Product.create(name: "B5_2Z_1B_20", description: "B5_2Z_1B_20", code: "B5_2Z_1B_20")
B5_2B_1B_22 = Product.create(name: "B5_2B_1B_22", description: "B5_2B_1B_22", code: "B5_2B_1B_22")
B5_2B_2B_23 = Product.create(name: "B5_2B_2B_23", description: "B5_2B_2B_23", code: "B5_2B_2B_23")
B5_2B_3B_26 = Product.create(name: "B5_2B_3B_26", description: "B5_2B_3B_26", code: "B5_2B_3B_26")
B5_2B_4B_27 = Product.create(name: "B5_2B_4B_27", description: "B5_2B_4B_27", code: "B5_2B_4B_27")
B5_2B_5B_30 = Product.create(name: "B5_2B_5B_30", description: "B5_2B_5B_30", code: "B5_2B_5B_30")
B5_2B_6B_31 = Product.create(name: "B5_2B_6B_31", description: "B5_2B_6B_31", code: "B5_2B_6B_31")
B5_3B_1B_2 = Product.create(name: "B5_3B_1B_2", description: "B5_3B_1B_2", code: "B5_3B_1B_2")
    
    
B5_2Y_1B_19 = Product.create(name: "B5_2Y_1B_19", description: "B5_2Y_1B_19", code: "B5_2Y_1B_19")
B5_2A_1B_21 = Product.create(name: "B5_2A_1B_21", description: "B5_2A_1B_21", code: "B5_2A_1B_21")
B5_2E_1B_24 = Product.create(name: "B5_2E_1B_24", description: "B5_2E_1B_24", code: "B5_2E_1B_24")
B5_2F_1B_25 = Product.create(name: "B5_2F_1B_25", description: "B5_2F_1B_25", code: "B5_2F_1B_25")
B5_2E_2B_28 = Product.create(name: "B5_2E_2B_28", description: "B5_2E_2B_28", code: "B5_2E_2B_28")
B5_2F_2B_29 = Product.create(name: "B5_2F_2B_29", description: "B5_2F_2B_29", code: "B5_2F_2B_29")
B5_2A_2B_32 = Product.create(name: "B5_2A_2B_32", description: "B5_2A_2B_32", code: "B5_2A_2B_32")
B5_3A_1B_1 = Product.create(name: "B5_3A_1B_1", description: "B5_3A_1B_1", code: "B5_3A_1B_1")
              
    
    
    ##Block6

    #Front
    
B6_3D_1F_3 = Product.create(name: "B6_3D_1F_3", description: "B6_3D_1F_3", code: "B6_3D_1F_3")
B6_2B_1F_6 = Product.create(name: "B6_2B_1F_6", description: "B6_2B_1F_6", code: "B6_2B_1F_6")
B6_2B_2F_7 = Product.create(name: "B6_2B_2F_7", description: "B6_2B_2F_7", code: "B6_2B_2F_7")
B6_2B_3F_10 = Product.create(name: "B6_2B_3F_10", description: "B6_2B_3F_10", code: "B6_2B_3F_10")
B6_2B_4F_11 = Product.create(name: "B6_2B_4F_11", description: "B6_2B_4F_11", code: "B6_2B_4F_11")
B6_3B_1F_13 = Product.create(name: "B6_3B_1F_13", description: "B6_3B_1F_13", code: "B6_3B_1F_13")
                 
B6_3C_1F_4 = Product.create(name: "B6_3C_1F_4", description: "B6_3C_1F_4", code: "B6_3C_1F_4")
B6_2A_1F_5 = Product.create(name: "B6_2A_1F_5", description: "B6_2A_1F_5", code: "B6_2A_1F_5")
B6_2E_1F_9 = Product.create(name: "B6_2E_1F_9", description: "B6_2E_1F_9", code: "B6_2E_1F_9")
B6_2F_1F_8 = Product.create(name: "B6_2F_1F_8", description: "B6_2F_1F_8", code: "B6_2F_1F_8")
B6_2A_2F_12 = Product.create(name: "B6_2A_2F_12", description: "B6_2A_2F_12", code: "B6_2A_2F_12")
B6_3A_1F_14 = Product.create(name: "B6_3A_1F_14", description: "B6_3A_1F_14", code: "B6_3A_1F_14")
    
    


    #Back
B6_3D_1B_16 = Product.create(name: "B6_3D_1B_16", description: "B6_3D_1B_16", code: "B6_3D_1B_16")
B6_2B_1B_18 = Product.create(name: "B6_2B_1B_18", description: "B6_2B_1B_18", code: "B6_2B_1B_18")
B6_2B_2B_19 = Product.create(name: "B6_2B_2B_19", description: "B6_2B_2B_19", code: "B6_2B_2B_19")
B6_2B_3B_22 = Product.create(name: "B6_2B_3B_22", description: "B6_2B_3B_22", code: "B6_2B_3B_22")
B6_2B_4B_23 = Product.create(name: "B6_2B_4B_23", description: "B6_2B_4B_23", code: "B6_2B_4B_23")
B6_3B_1B_2 = Product.create(name: "B6_3B_1B_2", description: "B6_3B_1B_2", code: "B6_3B_1B_2")
                 
B6_3C_1B_15 = Product.create(name: "B6_3C_1B_15", description: "B6_3C_1B_15", code: "B6_3C_1B_15")
B6_2A_1B_17 = Product.create(name: "B6_2A_1B_17", description: "B6_2A_1B_17", code: "B6_2A_1B_17")
B6_2E_1B_20 = Product.create(name: "B6_2E_1B_20", description: "B6_2E_1B_20", code: "B6_2E_1B_20")
B6_2F_1B_21 = Product.create(name: "B6_2F_1B_21", description: "B6_2F_1B_21", code: "B6_2F_1B_21")
B6_2A_2B_24 = Product.create(name: "B6_2A_2B_24", description: "B6_2A_2B_24", code: "B6_2A_2B_24")
B6_3A_1B_1 = Product.create(name: "B6_3A_1B_1", description: "B6_3A_1B_1", code: "B6_3A_1B_1")
        
    
       
    ##Block7

    #Front
B7_2Z_1F_2 = Product.create(name: "B7_2Z_1F_2", description: "B7_2Z_1F_2", code: "B7_2Z_1F_2")
B7_2B_1F_6 = Product.create(name: "B7_2B_1F_6", description: "B7_2B_1F_6", code: "B7_2B_1F_6")
B7_2B_2F_7 = Product.create(name: "B7_2B_2F_7", description: "B7_2B_2F_7", code: "B7_2B_2F_7")
B7_2B_3F_10 = Product.create(name: "B7_2B_3F_10", description: "B7_2B_3F_10", code: "B7_2B_3F_10")
B7_2D_1F_11 = Product.create(name: "B7_2D_1F_11", description: "B7_2D_1F_11", code: "B7_2D_1F_11")
    
B7_2C_1F_4 = Product.create(name: "B7_2C_1F_4", description: "B7_2C_1F_4", code: "B7_2C_1F_4")
B7_2A_1F_5 = Product.create(name: "B7_2A_1F_5", description: "B7_2A_1F_5", code: "B7_2A_1F_5")
B7_2E_1F_9 = Product.create(name: "B7_2E_1F_9", description: "B7_2E_1F_9", code: "B7_2E_1F_9")
B7_2F_1F_8 = Product.create(name: "B7_2F_1F_8", description: "B7_2F_1F_8", code: "B7_2F_1F_8")
B7_2Y_1F_12 = Product.create(name: "B7_2Y_1F_12", description: "B7_2Y_1F_12", code: "B7_2Y_1F_12")
    
    
    
    #Back
B7_2Z_1B_14 = Product.create(name: "B7_2Z_1B_14", description: "B7_2Z_1B_14", code: "B7_2Z_1B_14")
B7_2B_1B_15 = Product.create(name: "B7_2B_1B_15", description: "B7_2B_1B_15", code: "B7_2B_1B_15")
B7_2B_2B_18 = Product.create(name: "B7_2B_2B_18", description: "B7_2B_2B_18", code: "B7_2B_2B_18")
B7_2B_3B_19 = Product.create(name: "B7_2B_3B_19", description: "B7_2B_3B_19", code: "B7_2B_3B_19")
B7_2D_1B_3 = Product.create(name: "B7_2D_1B_3", description: "B7_2D_1B_3", code: "B7_2D_1B_3")
    
B7_2Y_1B_13 = Product.create(name: "B7_2Y_1B_13", description: "B7_2Y_1B_13", code: "B7_2Y_1B_13")
B7_2E_1B_16 = Product.create(name: "B7_2E_1B_16", description: "B7_2E_1B_16", code: "B7_2E_1B_16")
B7_2F_1B_17 = Product.create(name: "B7_2F_1B_17", description: "B7_2F_1B_17", code: "B7_2F_1B_17")
B7_2A_1B_20 = Product.create(name: "B7_2A_1B_20", description: "B7_2A_1B_20", code: "B7_2A_1B_20")
B7_2C_1B_1 = Product.create(name: "B7_2C_1B_1", description: "B7_2C_1B_1", code: "B7_2C_1B_1")
    
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
            Minto2YPrice = Valuefield.create(fieldvalue: "340200", property_id: price.id, code: "")
            Minto2ZPrice = Valuefield.create(fieldvalue: "340200", property_id: price.id, code: "")
            Minto2CPrice = Valuefield.create(fieldvalue: "337050", property_id: price.id, code: "")
            Minto2DPrice = Valuefield.create(fieldvalue: "350595", property_id: price.id, code: "")
            Minto2EPrice = Valuefield.create(fieldvalue: "299250", property_id: price.id, code: "")
            Minto2FPrice = Valuefield.create(fieldvalue: "323505", property_id: price.id, code: "")
            Minto3APrice = Valuefield.create(fieldvalue: "478800", property_id: price.id, code: "")
            Minto3BPrice = Valuefield.create(fieldvalue: "482895", property_id: price.id, code: "")
            Minto3CPrice = Valuefield.create(fieldvalue: "457695", property_id: price.id, code: "")
            Minto3DPrice = Valuefield.create(fieldvalue: "478800", property_id: price.id, code: "")


            Minto2ASize = Valuefield.create(fieldvalue: "1032", property_id: size.id, code: "")
            Minto2YSize = Valuefield.create(fieldvalue: "1032", property_id: size.id, code: "")
            Minto2BSize = Valuefield.create(fieldvalue: "1080", property_id: size.id, code: "")
            Minto2ZSize = Valuefield.create(fieldvalue: "1080", property_id: size.id, code: "")
            Minto2CSize = Valuefield.create(fieldvalue: "1070", property_id: size.id, code: "")
            Minto2DSize = Valuefield.create(fieldvalue: "1113", property_id: size.id, code: "")
            Minto2ESize = Valuefield.create(fieldvalue: "950",  property_id: size.id, code: "")
            Minto2FSize = Valuefield.create(fieldvalue: "1027", property_id: size.id, code: "")
            Minto3ASize = Valuefield.create(fieldvalue: "1520", property_id: size.id, code: "")
            Minto3BSize = Valuefield.create(fieldvalue: "1533", property_id: size.id, code: "")
            Minto3CSize = Valuefield.create(fieldvalue: "1453", property_id: size.id, code: "")
            Minto3DSize = Valuefield.create(fieldvalue: "1520", property_id: size.id, code: "")

    
            Minto2APremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto2YPremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto2BPremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto2ZPremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto2CPremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto2DPremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto2EPremium = Valuefield.create(fieldvalue: "none",  property_id: premium.id, code: "")
            Minto2FPremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto3APremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto3BPremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
            Minto3CPremium = Valuefield.create(fieldvalue: "none", property_id: premium.id, code: "")
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



    
    ##Block5

    #Front
B5_2Z_1F_3.properties = [availability, price, size, premium]
B5_2B_1F_6.properties = [availability, price, size, premium]
B5_2B_2F_7.properties = [availability, price, size, premium]
B5_2B_3F_10.properties = [availability, price, size, premium]
B5_2B_4F_11.properties = [availability, price, size, premium]
B5_2B_5F_14.properties = [availability, price, size, premium]
B5_2B_6F_15.properties = [availability, price, size, premium]
B5_3B_1F_17.properties = [availability, price, size, premium]
    
    
B5_2Y_1F_4.properties = [availability, price, size, premium]
B5_2A_1F_5.properties = [availability, price, size, premium]
B5_2E_1F_9.properties = [availability, price, size, premium]
B5_2F_1F_8.properties = [availability, price, size, premium]
B5_2E_2F_13.properties = [availability, price, size, premium]
B5_2F_2F_12.properties = [availability, price, size, premium]
B5_2A_2F_16.properties = [availability, price, size, premium]
B5_3A_1F_18.properties = [availability, price, size, premium]
    
    
    

    #Back

    
B5_2Z_1B_20.properties = [availability, price, size, premium]
B5_2B_1B_22.properties = [availability, price, size, premium]
B5_2B_2B_23.properties = [availability, price, size, premium]
B5_2B_3B_26.properties = [availability, price, size, premium]
B5_2B_4B_27.properties = [availability, price, size, premium]
B5_2B_5B_30.properties = [availability, price, size, premium]
B5_2B_6B_31.properties = [availability, price, size, premium]
B5_3B_1B_2.properties = [availability, price, size, premium]
    
    
B5_2Y_1B_19.properties = [availability, price, size, premium]
B5_2A_1B_21.properties = [availability, price, size, premium]
B5_2E_1B_24.properties = [availability, price, size, premium]
B5_2F_1B_25.properties = [availability, price, size, premium]
B5_2E_2B_28.properties = [availability, price, size, premium]
B5_2F_2B_29.properties = [availability, price, size, premium]
B5_2A_2B_32.properties = [availability, price, size, premium]
B5_3A_1B_1.properties = [availability, price, size, premium]
              
    
    
    ##Block6

    #Front
    
B6_3D_1F_3.properties = [availability, price, size, premium]
B6_2B_1F_6.properties = [availability, price, size, premium]
B6_2B_2F_7.properties = [availability, price, size, premium]
B6_2B_3F_10.properties = [availability, price, size, premium]
B6_2B_4F_11.properties = [availability, price, size, premium]
B6_3B_1F_13.properties = [availability, price, size, premium]
                 
B6_3C_1F_4.properties = [availability, price, size, premium]
B6_2A_1F_5.properties = [availability, price, size, premium]
B6_2E_1F_9.properties = [availability, price, size, premium]
B6_2F_1F_8.properties = [availability, price, size, premium]
B6_2A_2F_12.properties = [availability, price, size, premium]
B6_3A_1F_14.properties = [availability, price, size, premium]
    
    


    #Back
B6_3D_1B_16.properties = [availability, price, size, premium]
B6_2B_1B_18.properties = [availability, price, size, premium]
B6_2B_2B_19.properties = [availability, price, size, premium]
B6_2B_3B_22.properties = [availability, price, size, premium]
B6_2B_4B_23.properties = [availability, price, size, premium]
B6_3B_1B_2.properties = [availability, price, size, premium]
                 
B6_3C_1B_15.properties = [availability, price, size, premium]
B6_2A_1B_17.properties = [availability, price, size, premium]
B6_2E_1B_20.properties = [availability, price, size, premium]
B6_2F_1B_21.properties = [availability, price, size, premium]
B6_2A_2B_24.properties = [availability, price, size, premium]
B6_3A_1B_1.properties = [availability, price, size, premium]
        
    
       
    ##Block7

    #Front
B7_2Z_1F_2.properties = [availability, price, size, premium]
B7_2B_1F_6.properties = [availability, price, size, premium]
B7_2B_2F_7.properties = [availability, price, size, premium]
B7_2B_3F_10.properties = [availability, price, size, premium]
B7_2D_1F_11.properties = [availability, price, size, premium]
    
B7_2C_1F_1.properties = [availability, price, size, premium]
B7_2A_1F_5.properties = [availability, price, size, premium]
B7_2E_1F_9.properties = [availability, price, size, premium]
B7_2F_1F_8.properties = [availability, price, size, premium]
B7_2Y_1F_12.properties = [availability, price, size, premium]
    
    
    
    #Back
B7_2Z_1B_14.properties = [availability, price, size, premium]
B7_2B_1B_15.properties = [availability, price, size, premium]
B7_2B_2B_18.properties = [availability, price, size, premium]
B7_2B_3B_19.properties = [availability, price, size, premium]
B7_2D_1B_3.properties = [availability, price, size, premium]
    
B7_2Y_1B_13.properties = [availability, price, size, premium]
B7_2E_1B_16.properties = [availability, price, size, premium]
B7_2F_1B_17.properties = [availability, price, size, premium]
B7_2A_1B_20.properties = [availability, price, size, premium]
B7_2C_1B_4.properties = [availability, price, size, premium]




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

       
    ##Block5

    #Front
B5_2Z_1F_3.valuefields = [MintoAvailable, Minto2ZPrice, Minto2ZSize, Minto2ZPremium]
B5_2B_1F_6.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B5_2B_2F_7.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B5_2B_3F_10.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B5_2B_4F_11.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B5_2B_5F_14.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B5_2B_6F_15.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B5_3B_1F_17.valuefields = [MintoAvailable, Minto3BPrice, Minto3BSize, Minto3BPremium]
    
    
B5_2Y_1F_4.valuefields = [MintoAvailable, Minto2YPrice, Minto2YSize, Minto2YPremium]
B5_2A_1F_5.valuefields = [MintoAvailable, Minto2APrice, Minto2ASize, Minto2APremium]
B5_2E_1F_9.valuefields = [MintoAvailable, Minto2EPrice, Minto2ESize, Minto2EPremium]
B5_2F_1F_8.valuefields = [MintoAvailable, Minto2FPrice, Minto2FSize, Minto2FPremium]
B5_2E_2F_13.valuefields = [MintoAvailable, Minto2EPrice, Minto2ESize, Minto2EPremium]
B5_2F_2F_12.valuefields = [MintoAvailable, Minto2FPrice, Minto2FSize, Minto2FPremium]
B5_2A_2F_16.valuefields = [MintoAvailable, Minto2APrice, Minto2ASize, Minto2APremium]
B5_3A_1F_18.valuefields = [MintoAvailable, Minto3APrice, Minto3ASize, Minto3APremium]
    
    
    

    #Back

    
B5_2Z_1B_20.valuefields = [MintoAvailable, Minto2ZPrice, Minto2ZSize, Minto2ZPremium]
B5_2B_1B_22.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B5_2B_2B_23.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B5_2B_3B_26.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B5_2B_4B_27.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B5_2B_5B_30.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B5_2B_6B_31.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B5_3B_1B_2.valuefields = [MintoAvailable, Minto3BPrice, Minto3BSize, Minto3BPremium]
    
    
B5_2Y_1B_19.valuefields = [MintoAvailable, Minto2YPrice, Minto2YSize, Minto2YPremium]
B5_2A_1B_21.valuefields = [MintoAvailable, Minto2APrice, Minto2ASize, Minto2APremium]
B5_2E_1B_24.valuefields = [MintoAvailable, Minto2EPrice, Minto2ESize, Minto2EPremium]
B5_2F_1B_25.valuefields = [MintoAvailable, Minto2FPrice, Minto2FSize, Minto2FPremium]
B5_2E_2B_28.valuefields = [MintoAvailable, Minto2EPrice, Minto2ESize, Minto2EPremium]
B5_2F_2B_29.valuefields = [MintoAvailable, Minto2FPrice, Minto2FSize, Minto2FPremium]
B5_2A_2B_32.valuefields = [MintoAvailable, Minto2APrice, Minto2ASize, Minto2APremium]
B5_3A_1B_1.valuefields = [MintoAvailable, Minto3APrice, Minto3ASize, Minto3APremium]
              
    
    
    ##Block6

    #Front
    
B6_3D_1F_3.valuefields = [MintoAvailable, Minto3DPrice, Minto3DSize, Minto3DPremium]
B6_2B_1F_6.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B6_2B_2F_7.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B6_2B_3F_10.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B6_2B_4F_11.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B6_3B_1F_13.valuefields = [MintoAvailable, Minto3BPrice, Minto3BSize, Minto3BPremium]
                 
B6_3C_1F_4.valuefields = [MintoAvailable, Minto3CPrice, Minto3CSize, Minto3CPremium]
B6_2A_1F_5.valuefields = [MintoAvailable, Minto2APrice, Minto2ASize, Minto2APremium]
B6_2E_1F_9.valuefields = [MintoAvailable, Minto2EPrice, Minto2ESize, Minto2EPremium]
B6_2F_1F_8.valuefields = [MintoAvailable, Minto2FPrice, Minto2FSize, Minto2FPremium]
B6_2A_2F_12.valuefields = [MintoAvailable, Minto2APrice, Minto2ASize, Minto2APremium]
B6_3A_1F_14.valuefields = [MintoAvailable, Minto3APrice, Minto3ASize, Minto3APremium]
    
    


    #Back
B6_3D_1B_16.valuefields = [MintoAvailable, Minto3DPrice, Minto3DSize, Minto3DPremium]
B6_2B_1B_18.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B6_2B_2B_19.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B6_2B_3B_22.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B6_2B_4B_23.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B6_3B_1B_2.valuefields = [MintoAvailable, Minto3BPrice, Minto3BSize, Minto3BPremium]
                 
B6_3C_1B_15.valuefields = [MintoAvailable, Minto3CPrice, Minto3CSize, Minto3CPremium]
B6_2A_1B_17.valuefields = [MintoAvailable, Minto2APrice, Minto2ASize, Minto2APremium]
B6_2E_1B_20.valuefields = [MintoAvailable, Minto2EPrice, Minto2ESize, Minto2EPremium]
B6_2F_1B_21.valuefields = [MintoAvailable, Minto2FPrice, Minto2FSize, Minto2FPremium]
B6_2A_2B_24.valuefields = [MintoAvailable, Minto2APrice, Minto2ASize, Minto2APremium]
B6_3A_1B_1.valuefields = [MintoAvailable, Minto3APrice, Minto3ASize, Minto3APremium]
        
    
       
    ##Block7

    #Front
B7_2Z_1F_2.valuefields = [MintoAvailable, Minto2ZPrice, Minto2ZSize, Minto2ZPremium]
B7_2B_1F_6.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B7_2B_2F_7.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B7_2B_3F_10.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B7_2D_1F_11.valuefields = [MintoAvailable, Minto2DPrice, Minto2DSize, Minto2DPremium]
    
B7_2C_1F_1.valuefields = [MintoAvailable, Minto2CPrice, Minto2CSize, Minto2CPremium]
B7_2A_1F_5.valuefields = [MintoAvailable, Minto2APrice, Minto2ASize, Minto2APremium]
B7_2E_1F_9.valuefields = [MintoAvailable, Minto2EPrice, Minto2ESize, Minto2EPremium]
B7_2F_1F_8.valuefields = [MintoAvailable, Minto2FPrice, Minto2FSize, Minto2FPremium]
B7_2Y_1F_12.valuefields = [MintoAvailable, Minto2YPrice, Minto2YSize, Minto2YPremium]
    
    
    
    #Back
B7_2Z_1B_14.valuefields = [MintoAvailable, Minto2ZPrice, Minto2ZSize, Minto2ZPremium]
B7_2B_1B_15.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B7_2B_2B_18.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B7_2B_3B_19.valuefields = [MintoAvailable, Minto2BPrice, Minto2BSize, Minto2BPremium]
B7_2D_1B_3.valuefields = [MintoAvailable, Minto2DPrice, Minto2DSize, Minto2DPremium]
    
B7_2Y_1B_13.valuefields = [MintoAvailable, Minto2YPrice, Minto2YSize, Minto2YPremium]
B7_2E_1B_16.valuefields = [MintoAvailable, Minto2EPrice, Minto2ESize, Minto2EPremium]
B7_2F_1B_17.valuefields = [MintoAvailable, Minto2FPrice, Minto2FSize, Minto2FPremium]
B7_2A_1B_20.valuefields = [MintoAvailable, Minto2APrice, Minto2ASize, Minto2APremium]
B7_2C_1B_4.valuefields = [MintoAvailable, Minto2CPrice, Minto2CSize, Minto2CPremium]


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
            B4_3A_1B_4,
    
    
            B5_2Z_1F_3,
            B5_2B_1F_6,
            B5_2B_2F_7,
            B5_2B_3F_10,
            B5_2B_4F_11,
            B5_2B_5F_14,
            B5_2B_6F_15,
            B5_3B_1F_17,


            B5_2Y_1F_4,
            B5_2A_1F_5,
            B5_2E_1F_9,
            B5_2F_1F_8,
            B5_2E_2F_13,
            B5_2F_2F_12,
            B5_2A_2F_16,
            B5_3A_1F_18,




                #Back


            B5_2Z_1B_20,
            B5_2B_1B_22,
            B5_2B_2B_23,
            B5_2B_3B_26,
            B5_2B_4B_27,
            B5_2B_5B_30,
            B5_2B_6B_31,
            B5_3B_1B_2,


            B5_2Y_1B_19,
            B5_2A_1B_21,
            B5_2E_1B_24,
            B5_2F_1B_25,
            B5_2E_2B_28,
            B5_2F_2B_29,
            B5_2A_2B_32,
            B5_3A_1B_1,



                ##Block6

                #Front

            B6_3D_1F_3,
            B6_2B_1F_6,
            B6_2B_2F_7,
            B6_2B_3F_10,
            B6_2B_4F_11,
            B6_3B_1F_13,

            B6_3C_1F_4,
            B6_2A_1F_5,
            B6_2E_1F_9,
            B6_2F_1F_8,
            B6_2A_2F_12,
            B6_3A_1F_14,




                #Back
            B6_3D_1B_16,
            B6_2B_1B_18,
            B6_2B_2B_19,
            B6_2B_3B_22,
            B6_2B_4B_23,
            B6_3B_1B_2,

            B6_3C_1B_15,
            B6_2A_1B_17,
            B6_2E_1B_20,
            B6_2F_1B_21,
            B6_2A_2B_24,
            B6_3A_1B_1,



                ##Block7

                #Front
            B7_2Z_1F_2,
            B7_2B_1F_6,
            B7_2B_2F_7,
            B7_2B_3F_10,
            B7_2D_1F_11,

            B7_2C_1F_1,
            B7_2A_1F_5,
            B7_2E_1F_9,
            B7_2F_1F_8,
            B7_2Y_1F_12,



                #Back
            B7_2Z_1B_14,
            B7_2B_1B_15,
            B7_2B_2B_18,
            B7_2B_3B_19,
            B7_2D_1B_3,

            B7_2Y_1B_13,
            B7_2E_1B_16,
            B7_2F_1B_17,
            B7_2A_1B_20,
            B7_2C_1B_4
    ]



################################################################################################################
#Table Alias                                                                                                   #
################################################################################################################


################################################################################################################
#All Seating Test                                                                                              #
#End of Seed                                                                                                   #
################################################################################################################

  end
end
