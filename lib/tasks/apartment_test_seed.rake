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





###Floor 5
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

###Floor 6
suite601 = Product.create(name: "Suite 601", description: "Building A 6th Floor Suite", code: "FL_6_Bamboo")
suite602 = Product.create(name: "Suite 602", description: "Building A 6th Floor Suite", code: "FL_6_Burnet")
suite603 = Product.create(name: "Suite 603", description: "Building A 6th Floor Suite", code: "FL_6_Cherry")
suite604 = Product.create(name: "Suite 604", description: "Building A 6th Floor Suite", code: "FL_6_Cypress")
suite605 = Product.create(name: "Suite 605", description: "Building A 6th Floor Suite", code: "FL_6_Ginkgo_A")
suite606 = Product.create(name: "Suite 606", description: "Building A 6th Floor Suite", code: "FL_6_Ginkgo_B")
suite607 = Product.create(name: "Suite 607", description: "Building A 6th Floor Suite", code: "FL_6_Peony")
suite608 = Product.create(name: "Suite 608", description: "Building A 6th Floor Suite", code: "FL_6_Plum_A")
suite609 = Product.create(name: "Suite 609", description: "Building A 6th Floor Suite", code: "FL_6_Plum_B")
suite610 = Product.create(name: "Suite 610", description: "Building A 6th Floor Suite", code: "FL_6_Redwood")
suite611 = Product.create(name: "Suite 611", description: "Building A 6th Floor Suite", code: "FL_6_Spruce")

###Floor 7
suite701 = Product.create(name: "Suite 701", description: "Building A 7th Floor Suite", code: "FL_7_Bamboo")
suite702 = Product.create(name: "Suite 702", description: "Building A 7th Floor Suite", code: "FL_7_Burnet")
suite703 = Product.create(name: "Suite 703", description: "Building A 7th Floor Suite", code: "FL_7_Cherry")
suite704 = Product.create(name: "Suite 704", description: "Building A 7th Floor Suite", code: "FL_7_Cypress")
suite705 = Product.create(name: "Suite 705", description: "Building A 7th Floor Suite", code: "FL_7_Ginkgo_A")
suite706 = Product.create(name: "Suite 706", description: "Building A 7th Floor Suite", code: "FL_7_Ginkgo_B")
suite707 = Product.create(name: "Suite 707", description: "Building A 7th Floor Suite", code: "FL_7_Peony")
suite708 = Product.create(name: "Suite 708", description: "Building A 7th Floor Suite", code: "FL_7_Plum_A")
suite709 = Product.create(name: "Suite 709", description: "Building A 7th Floor Suite", code: "FL_7_Plum_B")
suite710 = Product.create(name: "Suite 710", description: "Building A 7th Floor Suite", code: "FL_7_Redwood")
suite711 = Product.create(name: "Suite 711", description: "Building A 7th Floor Suite", code: "FL_7_Spruce")

###Floor 8
suite801 = Product.create(name: "Suite 801", description: "Building A 8th Floor Suite", code: "FL_8_Bamboo")
suite802 = Product.create(name: "Suite 802", description: "Building A 8th Floor Suite", code: "FL_8_Burnet")
suite803 = Product.create(name: "Suite 803", description: "Building A 8th Floor Suite", code: "FL_8_Cherry")
suite804 = Product.create(name: "Suite 804", description: "Building A 8th Floor Suite", code: "FL_8_Cypress")
suite805 = Product.create(name: "Suite 805", description: "Building A 8th Floor Suite", code: "FL_8_Ginkgo_A")
suite806 = Product.create(name: "Suite 806", description: "Building A 8th Floor Suite", code: "FL_8_Ginkgo_B")
suite807 = Product.create(name: "Suite 807", description: "Building A 8th Floor Suite", code: "FL_8_Peony")
suite808 = Product.create(name: "Suite 808", description: "Building A 8th Floor Suite", code: "FL_8_Plum_A")
suite809 = Product.create(name: "Suite 809", description: "Building A 8th Floor Suite", code: "FL_8_Plum_B")
suite810 = Product.create(name: "Suite 810", description: "Building A 8th Floor Suite", code: "FL_8_Redwood")
suite811 = Product.create(name: "Suite 811", description: "Building A 8th Floor Suite", code: "FL_8_Spruce")

###Floor 9
suite901 = Product.create(name: "Suite 901", description: "Building A 9th Floor Suite", code: "FL_9_Bamboo")
suite902 = Product.create(name: "Suite 902", description: "Building A 9th Floor Suite", code: "FL_9_Burnet")
suite903 = Product.create(name: "Suite 903", description: "Building A 9th Floor Suite", code: "FL_9_Cherry")
suite904 = Product.create(name: "Suite 904", description: "Building A 9th Floor Suite", code: "FL_9_Cypress")
suite905 = Product.create(name: "Suite 909", description: "Building A 9th Floor Suite", code: "FL_9_Ginkgo_A")
suite906 = Product.create(name: "Suite 906", description: "Building A 9th Floor Suite", code: "FL_9_Ginkgo_B")
suite907 = Product.create(name: "Suite 907", description: "Building A 9th Floor Suite", code: "FL_9_Peony")
suite908 = Product.create(name: "Suite 908", description: "Building A 9th Floor Suite", code: "FL_9_Plum_A")
suite909 = Product.create(name: "Suite 909", description: "Building A 9th Floor Suite", code: "FL_9_Plum_B")
suite910 = Product.create(name: "Suite 910", description: "Building A 9th Floor Suite", code: "FL_9_Redwood")
suite911 = Product.create(name: "Suite 911", description: "Building A 9th Floor Suite", code: "FL_9_Spruce")

###Floor 10
suite1001 = Product.create(name: "Suite 1001", description: "Building A 10th Floor Suite", code: "FL_10_Bamboo")
suite1002 = Product.create(name: "Suite 1002", description: "Building A 10th Floor Suite", code: "FL_10_Burnet")
suite1003 = Product.create(name: "Suite 1003", description: "Building A 10th Floor Suite", code: "FL_10_Cherry")
suite1004 = Product.create(name: "Suite 1004", description: "Building A 10th Floor Suite", code: "FL_10_Cypress")
suite1005 = Product.create(name: "Suite 1005", description: "Building A 10th Floor Suite", code: "FL_10_Ginkgo_A")
suite1006 = Product.create(name: "Suite 1006", description: "Building A 10th Floor Suite", code: "FL_10_Ginkgo_B")
suite1007 = Product.create(name: "Suite 1007", description: "Building A 10th Floor Suite", code: "FL_10_Peony")
suite1008 = Product.create(name: "Suite 1008", description: "Building A 10th Floor Suite", code: "FL_10_Plum_A")
suite1009 = Product.create(name: "Suite 1009", description: "Building A 10th Floor Suite", code: "FL_10_Plum_B")
suite1010 = Product.create(name: "Suite 1010", description: "Building A 10th Floor Suite", code: "FL_10_Redwood")
suite1011 = Product.create(name: "Suite 1011", description: "Building A 10th Floor Suite", code: "FL_10_Spruce")

###Floor 11
suite1101 = Product.create(name: "Suite 1101", description: "Building A 11th Floor Suite", code: "FL_11_Bamboo")
suite1102 = Product.create(name: "Suite 1102", description: "Building A 11th Floor Suite", code: "FL_11_Burnet")
suite1103 = Product.create(name: "Suite 1103", description: "Building A 11th Floor Suite", code: "FL_11_Cherry")
suite1104 = Product.create(name: "Suite 1104", description: "Building A 11th Floor Suite", code: "FL_11_Cypress")
suite1105 = Product.create(name: "Suite 1105", description: "Building A 11th Floor Suite", code: "FL_11_Ginkgo_A")
suite1106 = Product.create(name: "Suite 1106", description: "Building A 11th Floor Suite", code: "FL_11_Ginkgo_B")
suite1107 = Product.create(name: "Suite 1107", description: "Building A 11th Floor Suite", code: "FL_11_Peony")
suite1108 = Product.create(name: "Suite 1108", description: "Building A 11th Floor Suite", code: "FL_11_Plum_A")
suite1109 = Product.create(name: "Suite 1109", description: "Building A 11th Floor Suite", code: "FL_11_Plum_B")
suite1110 = Product.create(name: "Suite 1110", description: "Building A 11th Floor Suite", code: "FL_11_Redwood")
suite1111 = Product.create(name: "Suite 1111", description: "Building A 11th Floor Suite", code: "FL_11_Spruce")

###Floor 12
suite1201 = Product.create(name: "Suite 1201", description: "Building A 12th Floor Suite", code: "FL_12_Bamboo")
suite1202 = Product.create(name: "Suite 1202", description: "Building A 12th Floor Suite", code: "FL_12_Burnet")
suite1203 = Product.create(name: "Suite 1203", description: "Building A 12th Floor Suite", code: "FL_12_Cherry")
suite1204 = Product.create(name: "Suite 1204", description: "Building A 12th Floor Suite", code: "FL_12_Cypress")
suite1205 = Product.create(name: "Suite 1205", description: "Building A 12th Floor Suite", code: "FL_12_Ginkgo_A")
suite1206 = Product.create(name: "Suite 1206", description: "Building A 12th Floor Suite", code: "FL_12_Ginkgo_B")
suite1207 = Product.create(name: "Suite 1207", description: "Building A 12th Floor Suite", code: "FL_12_Peony")
suite1208 = Product.create(name: "Suite 1208", description: "Building A 12th Floor Suite", code: "FL_12_Plum_A")
suite1209 = Product.create(name: "Suite 1209", description: "Building A 12th Floor Suite", code: "FL_12_Plum_B")
suite1210 = Product.create(name: "Suite 1210", description: "Building A 12th Floor Suite", code: "FL_12_Redwood")
suite1211 = Product.create(name: "Suite 1211", description: "Building A 12th Floor Suite", code: "FL_12_Spruce")
  
###Floor 13
suite1301 = Product.create(name: "Suite 1301", description: "Building A 13th Floor Suite", code: "FL_13_Bamboo")
suite1302 = Product.create(name: "Suite 1302", description: "Building A 13th Floor Suite", code: "FL_13_Burnet")
suite1303 = Product.create(name: "Suite 1303", description: "Building A 13th Floor Suite", code: "FL_13_Cherry")
suite1304 = Product.create(name: "Suite 1304", description: "Building A 13th Floor Suite", code: "FL_13_Cypress")
suite1305 = Product.create(name: "Suite 1305", description: "Building A 13th Floor Suite", code: "FL_13_Ginkgo_A")
suite1306 = Product.create(name: "Suite 1306", description: "Building A 13th Floor Suite", code: "FL_13_Ginkgo_B")
suite1307 = Product.create(name: "Suite 1307", description: "Building A 13th Floor Suite", code: "FL_13_Peony")
suite1308 = Product.create(name: "Suite 1308", description: "Building A 13th Floor Suite", code: "FL_13_Plum_A")
suite1309 = Product.create(name: "Suite 1309", description: "Building A 13th Floor Suite", code: "FL_13_Plum_B")
suite1310 = Product.create(name: "Suite 1310", description: "Building A 13th Floor Suite", code: "FL_13_Redwood")
suite1311 = Product.create(name: "Suite 1311", description: "Building A 13th Floor Suite", code: "FL_13_Spruce")
    
###Floor 14
suite1401 = Product.create(name: "Suite 1401", description: "Building A 14th Floor Suite", code: "FL_14_Bamboo")
suite1402 = Product.create(name: "Suite 1402", description: "Building A 14th Floor Suite", code: "FL_14_Burnet")
suite1403 = Product.create(name: "Suite 1403", description: "Building A 14th Floor Suite", code: "FL_14_Cherry")
suite1404 = Product.create(name: "Suite 1404", description: "Building A 14th Floor Suite", code: "FL_14_Cypress")
suite1405 = Product.create(name: "Suite 1405", description: "Building A 14th Floor Suite", code: "FL_14_Ginkgo_A")
suite1406 = Product.create(name: "Suite 1406", description: "Building A 14th Floor Suite", code: "FL_14_Ginkgo_B")
suite1407 = Product.create(name: "Suite 1407", description: "Building A 14th Floor Suite", code: "FL_14_Peony")
suite1408 = Product.create(name: "Suite 1408", description: "Building A 14th Floor Suite", code: "FL_14_Plum_A")
suite1409 = Product.create(name: "Suite 1409", description: "Building A 14th Floor Suite", code: "FL_14_Plum_B")
suite1410 = Product.create(name: "Suite 1410", description: "Building A 14th Floor Suite", code: "FL_14_Redwood")
suite1411 = Product.create(name: "Suite 1411", description: "Building A 14th Floor Suite", code: "FL_14_Spruce")
    
###Floor 15
suite1501 = Product.create(name: "Suite 1501", description: "Building A 15th Floor Suite", code: "FL_15_Bamboo")
suite1502 = Product.create(name: "Suite 1502", description: "Building A 15th Floor Suite", code: "FL_15_Burnet")
suite1503 = Product.create(name: "Suite 1503", description: "Building A 15th Floor Suite", code: "FL_15_Cherry")
suite1504 = Product.create(name: "Suite 1504", description: "Building A 15th Floor Suite", code: "FL_15_Cypress")
suite1505 = Product.create(name: "Suite 1505", description: "Building A 15th Floor Suite", code: "FL_15_Ginkgo_A")
suite1506 = Product.create(name: "Suite 1506", description: "Building A 15th Floor Suite", code: "FL_15_Ginkgo_B")
suite1507 = Product.create(name: "Suite 1507", description: "Building A 15th Floor Suite", code: "FL_15_Peony")
suite1508 = Product.create(name: "Suite 1508", description: "Building A 15th Floor Suite", code: "FL_15_Plum_A")
suite1509 = Product.create(name: "Suite 1509", description: "Building A 15th Floor Suite", code: "FL_15_Plum_B")
suite1510 = Product.create(name: "Suite 1510", description: "Building A 15th Floor Suite", code: "FL_15_Redwood")
suite1511 = Product.create(name: "Suite 1511", description: "Building A 15th Floor Suite", code: "FL_15_Spruce")
    
###Floor 16
suite1601 = Product.create(name: "Suite 1601", description: "Building A 16th Floor Suite", code: "FL_16_Bamboo")
suite1602 = Product.create(name: "Suite 1602", description: "Building A 16th Floor Suite", code: "FL_16_Burnet")
suite1603 = Product.create(name: "Suite 1603", description: "Building A 16th Floor Suite", code: "FL_16_Cherry")
suite1604 = Product.create(name: "Suite 1604", description: "Building A 16th Floor Suite", code: "FL_16_Cypress")
suite1605 = Product.create(name: "Suite 1605", description: "Building A 16th Floor Suite", code: "FL_16_Ginkgo_A")
suite1606 = Product.create(name: "Suite 1606", description: "Building A 16th Floor Suite", code: "FL_16_Ginkgo_B")
suite1607 = Product.create(name: "Suite 1607", description: "Building A 16th Floor Suite", code: "FL_16_Peony")
suite1608 = Product.create(name: "Suite 1608", description: "Building A 16th Floor Suite", code: "FL_16_Plum_A")
suite1609 = Product.create(name: "Suite 1609", description: "Building A 16th Floor Suite", code: "FL_16_Plum_B")
suite1610 = Product.create(name: "Suite 1610", description: "Building A 16th Floor Suite", code: "FL_16_Redwood")
suite1611 = Product.create(name: "Suite 1611", description: "Building A 16th Floor Suite", code: "FL_16_Spruce")
    
###Floor 17
suite1701 = Product.create(name: "Suite 1701", description: "Building A 17th Floor Suite", code: "FL_17_Bamboo")
suite1702 = Product.create(name: "Suite 1702", description: "Building A 17th Floor Suite", code: "FL_17_Burnet")
suite1703 = Product.create(name: "Suite 1703", description: "Building A 17th Floor Suite", code: "FL_17_Cherry")
suite1704 = Product.create(name: "Suite 1704", description: "Building A 17th Floor Suite", code: "FL_17_Cypress")
suite1705 = Product.create(name: "Suite 1705", description: "Building A 17th Floor Suite", code: "FL_17_Ginkgo_A")
suite1706 = Product.create(name: "Suite 1706", description: "Building A 17th Floor Suite", code: "FL_17_Ginkgo_B")
suite1707 = Product.create(name: "Suite 1707", description: "Building A 17th Floor Suite", code: "FL_17_Peony")
suite1708 = Product.create(name: "Suite 1708", description: "Building A 17th Floor Suite", code: "FL_17_Plum_A")
suite1709 = Product.create(name: "Suite 1709", description: "Building A 17th Floor Suite", code: "FL_17_Plum_B")
suite1710 = Product.create(name: "Suite 1710", description: "Building A 17th Floor Suite", code: "FL_17_Redwood")
suite1711 = Product.create(name: "Suite 1711", description: "Building A 17th Floor Suite", code: "FL_17_Spruce")
    
###Floor 18
suite1801 = Product.create(name: "Suite 1801", description: "Building A 18th Floor Suite", code: "FL_18_Bamboo")
suite1802 = Product.create(name: "Suite 1802", description: "Building A 18th Floor Suite", code: "FL_18_Burnet")
suite1803 = Product.create(name: "Suite 1803", description: "Building A 18th Floor Suite", code: "FL_18_Cherry")
suite1804 = Product.create(name: "Suite 1804", description: "Building A 18th Floor Suite", code: "FL_18_Cypress")
suite1805 = Product.create(name: "Suite 1805", description: "Building A 18th Floor Suite", code: "FL_18_Ginkgo_A")
suite1806 = Product.create(name: "Suite 1806", description: "Building A 18th Floor Suite", code: "FL_18_Ginkgo_B")
suite1807 = Product.create(name: "Suite 1807", description: "Building A 18th Floor Suite", code: "FL_18_Peony")
suite1808 = Product.create(name: "Suite 1808", description: "Building A 18th Floor Suite", code: "FL_18_Plum_A")
suite1809 = Product.create(name: "Suite 1809", description: "Building A 18th Floor Suite", code: "FL_18_Plum_B")
suite1810 = Product.create(name: "Suite 1810", description: "Building A 18th Floor Suite", code: "FL_18_Redwood")
suite1811 = Product.create(name: "Suite 1811", description: "Building A 18th Floor Suite", code: "FL_18_Spruce")
    
###Floor 19
suite1901 = Product.create(name: "Suite 1901", description: "Building A 19th Floor Suite", code: "FL_19_Bamboo")
suite1902 = Product.create(name: "Suite 1902", description: "Building A 19th Floor Suite", code: "FL_19_Burnet")
suite1903 = Product.create(name: "Suite 1903", description: "Building A 19th Floor Suite", code: "FL_19_Cherry")
suite1904 = Product.create(name: "Suite 1904", description: "Building A 19th Floor Suite", code: "FL_19_Cypress")
suite1905 = Product.create(name: "Suite 1905", description: "Building A 19th Floor Suite", code: "FL_19_Ginkgo_A")
suite1906 = Product.create(name: "Suite 1906", description: "Building A 19th Floor Suite", code: "FL_19_Ginkgo_B")
suite1907 = Product.create(name: "Suite 1907", description: "Building A 19th Floor Suite", code: "FL_19_Peony")
suite1908 = Product.create(name: "Suite 1908", description: "Building A 19th Floor Suite", code: "FL_19_Plum_A")
suite1909 = Product.create(name: "Suite 1909", description: "Building A 19th Floor Suite", code: "FL_19_Plum_B")
suite1910 = Product.create(name: "Suite 1910", description: "Building A 19th Floor Suite", code: "FL_19_Redwood")
suite1911 = Product.create(name: "Suite 1911", description: "Building A 19th Floor Suite", code: "FL_19_Spruce")
    
###Floor 20
suite2001 = Product.create(name: "Suite 2001", description: "Building A 20th Floor Suite", code: "FL_20_Bamboo")
suite2002 = Product.create(name: "Suite 2002", description: "Building A 20th Floor Suite", code: "FL_20_Burnet")
suite2003 = Product.create(name: "Suite 2003", description: "Building A 20th Floor Suite", code: "FL_20_Cherry")
suite2004 = Product.create(name: "Suite 2004", description: "Building A 20th Floor Suite", code: "FL_20_Cypress")
suite2005 = Product.create(name: "Suite 2005", description: "Building A 20th Floor Suite", code: "FL_20_Ginkgo_A")
suite2006 = Product.create(name: "Suite 2006", description: "Building A 20th Floor Suite", code: "FL_20_Ginkgo_B")
suite2007 = Product.create(name: "Suite 2007", description: "Building A 20th Floor Suite", code: "FL_20_Peony")
suite2008 = Product.create(name: "Suite 2008", description: "Building A 20th Floor Suite", code: "FL_20_Plum_A")
suite2009 = Product.create(name: "Suite 2009", description: "Building A 20th Floor Suite", code: "FL_20_Plum_B")
suite2010 = Product.create(name: "Suite 2010", description: "Building A 20th Floor Suite", code: "FL_20_Redwood")
suite2011 = Product.create(name: "Suite 2011", description: "Building A 20th Floor Suite", code: "FL_20_Spruce")
    
###Floor 21
suite2101 = Product.create(name: "Suite 2101", description: "Building A 21th Floor Suite", code: "FL_21_Bamboo")
suite2102 = Product.create(name: "Suite 2102", description: "Building A 21th Floor Suite", code: "FL_21_Burnet")
suite2103 = Product.create(name: "Suite 2103", description: "Building A 21th Floor Suite", code: "FL_21_Cherry")
suite2104 = Product.create(name: "Suite 2104", description: "Building A 21th Floor Suite", code: "FL_21_Cypress")
suite2105 = Product.create(name: "Suite 2105", description: "Building A 21th Floor Suite", code: "FL_21_Ginkgo_A")
suite2106 = Product.create(name: "Suite 2106", description: "Building A 21th Floor Suite", code: "FL_21_Ginkgo_B")
suite2107 = Product.create(name: "Suite 2107", description: "Building A 21th Floor Suite", code: "FL_21_Peony")
suite2108 = Product.create(name: "Suite 2108", description: "Building A 21th Floor Suite", code: "FL_21_Plum_A")
suite2109 = Product.create(name: "Suite 2109", description: "Building A 21th Floor Suite", code: "FL_21_Plum_B")
suite2110 = Product.create(name: "Suite 2110", description: "Building A 21th Floor Suite", code: "FL_21_Redwood")
suite2111 = Product.create(name: "Suite 2111", description: "Building A 21th Floor Suite", code: "FL_21_Spruce")
    
###Floor 22
suite2201 = Product.create(name: "Suite 2201", description: "Building A 22th Floor Suite", code: "FL_22_Bamboo")
suite2202 = Product.create(name: "Suite 2202", description: "Building A 22th Floor Suite", code: "FL_22_Burnet")
suite2203 = Product.create(name: "Suite 2203", description: "Building A 22th Floor Suite", code: "FL_22_Cherry")
suite2204 = Product.create(name: "Suite 2204", description: "Building A 22th Floor Suite", code: "FL_22_Cypress")
suite2205 = Product.create(name: "Suite 2205", description: "Building A 22th Floor Suite", code: "FL_22_Ginkgo_A")
suite2206 = Product.create(name: "Suite 2206", description: "Building A 22th Floor Suite", code: "FL_22_Ginkgo_B")
suite2207 = Product.create(name: "Suite 2207", description: "Building A 22th Floor Suite", code: "FL_22_Peony")
suite2208 = Product.create(name: "Suite 2208", description: "Building A 22th Floor Suite", code: "FL_22_Plum_A")
suite2209 = Product.create(name: "Suite 2209", description: "Building A 22th Floor Suite", code: "FL_22_Plum_B")
suite2210 = Product.create(name: "Suite 2210", description: "Building A 22th Floor Suite", code: "FL_22_Redwood")
suite2211 = Product.create(name: "Suite 2211", description: "Building A 22th Floor Suite", code: "FL_22_Spruce")
    
###Floor 23
suite2301 = Product.create(name: "Suite 2301", description: "Building A 23th Floor Suite", code: "FL_23_Bamboo")
suite2302 = Product.create(name: "Suite 2302", description: "Building A 23th Floor Suite", code: "FL_23_Burnet")
suite2303 = Product.create(name: "Suite 2303", description: "Building A 23th Floor Suite", code: "FL_23_Cherry")
suite2304 = Product.create(name: "Suite 2304", description: "Building A 23th Floor Suite", code: "FL_23_Cypress")
suite2305 = Product.create(name: "Suite 2305", description: "Building A 23th Floor Suite", code: "FL_23_Ginkgo_A")
suite2306 = Product.create(name: "Suite 2306", description: "Building A 23th Floor Suite", code: "FL_23_Ginkgo_B")
suite2307 = Product.create(name: "Suite 2307", description: "Building A 23th Floor Suite", code: "FL_23_Peony")
suite2308 = Product.create(name: "Suite 2308", description: "Building A 23th Floor Suite", code: "FL_23_Plum_A")
suite2309 = Product.create(name: "Suite 2309", description: "Building A 23th Floor Suite", code: "FL_23_Plum_B")
suite2310 = Product.create(name: "Suite 2310", description: "Building A 23th Floor Suite", code: "FL_23_Redwood")
suite2311 = Product.create(name: "Suite 2311", description: "Building A 23th Floor Suite", code: "FL_23_Spruce")
    
###Floor 24
suite2401 = Product.create(name: "Suite 2401", description: "Building A 24th Floor Suite", code: "FL_24_Bamboo")
suite2402 = Product.create(name: "Suite 2402", description: "Building A 24th Floor Suite", code: "FL_24_Burnet")
suite2403 = Product.create(name: "Suite 2403", description: "Building A 24th Floor Suite", code: "FL_24_Cherry")
suite2404 = Product.create(name: "Suite 2404", description: "Building A 24th Floor Suite", code: "FL_24_Cypress")
suite2405 = Product.create(name: "Suite 2405", description: "Building A 24th Floor Suite", code: "FL_24_Ginkgo_A")
suite2406 = Product.create(name: "Suite 2406", description: "Building A 24th Floor Suite", code: "FL_24_Ginkgo_B")
suite2407 = Product.create(name: "Suite 2407", description: "Building A 24th Floor Suite", code: "FL_24_Peony")
suite2408 = Product.create(name: "Suite 2408", description: "Building A 24th Floor Suite", code: "FL_24_Plum_A")
suite2409 = Product.create(name: "Suite 2409", description: "Building A 24th Floor Suite", code: "FL_24_Plum_B")
suite2410 = Product.create(name: "Suite 2410", description: "Building A 24th Floor Suite", code: "FL_24_Redwood")
suite2411 = Product.create(name: "Suite 2411", description: "Building A 24th Floor Suite", code: "FL_24_Spruce")
    
###Floor 25
suite2501 = Product.create(name: "Suite 2501", description: "Building A 25th Floor Suite", code: "FL_25_Bamboo")
suite2502 = Product.create(name: "Suite 2502", description: "Building A 25th Floor Suite", code: "FL_25_Burnet")
suite2503 = Product.create(name: "Suite 2503", description: "Building A 25th Floor Suite", code: "FL_25_Cherry")
suite2504 = Product.create(name: "Suite 2504", description: "Building A 25th Floor Suite", code: "FL_25_Cypress")
suite2505 = Product.create(name: "Suite 2505", description: "Building A 25th Floor Suite", code: "FL_25_Ginkgo_A")
suite2506 = Product.create(name: "Suite 2506", description: "Building A 25th Floor Suite", code: "FL_25_Ginkgo_B")
suite2507 = Product.create(name: "Suite 2507", description: "Building A 25th Floor Suite", code: "FL_25_Peony")
suite2508 = Product.create(name: "Suite 2508", description: "Building A 25th Floor Suite", code: "FL_25_Plum_A")
suite2509 = Product.create(name: "Suite 2509", description: "Building A 25th Floor Suite", code: "FL_25_Plum_B")
suite2510 = Product.create(name: "Suite 2510", description: "Building A 25th Floor Suite", code: "FL_25_Redwood")
suite2511 = Product.create(name: "Suite 2511", description: "Building A 25th Floor Suite", code: "FL_25_Spruce")
    
###Floor 26
suite2601 = Product.create(name: "Suite 2601", description: "Building A 26th Floor Suite", code: "FL_26_Bamboo")
suite2602 = Product.create(name: "Suite 2602", description: "Building A 26th Floor Suite", code: "FL_26_Burnet")
suite2603 = Product.create(name: "Suite 2603", description: "Building A 26th Floor Suite", code: "FL_26_Cherry")
suite2604 = Product.create(name: "Suite 2604", description: "Building A 26th Floor Suite", code: "FL_26_Cypress")
suite2605 = Product.create(name: "Suite 2605", description: "Building A 26th Floor Suite", code: "FL_26_Ginkgo_A")
suite2606 = Product.create(name: "Suite 2606", description: "Building A 26th Floor Suite", code: "FL_26_Ginkgo_B")
suite2607 = Product.create(name: "Suite 2607", description: "Building A 26th Floor Suite", code: "FL_26_Peony")
suite2608 = Product.create(name: "Suite 2608", description: "Building A 26th Floor Suite", code: "FL_26_Plum_A")
suite2609 = Product.create(name: "Suite 2609", description: "Building A 26th Floor Suite", code: "FL_26_Plum_B")
suite2610 = Product.create(name: "Suite 2610", description: "Building A 26th Floor Suite", code: "FL_26_Redwood")
suite2611 = Product.create(name: "Suite 2611", description: "Building A 26th Floor Suite", code: "FL_26_Spruce")
    
###Floor 27
suite2701 = Product.create(name: "Suite 2701", description: "Building A 27th Floor Suite", code: "FL_27_Bamboo")
suite2702 = Product.create(name: "Suite 2702", description: "Building A 27th Floor Suite", code: "FL_27_Burnet")
suite2703 = Product.create(name: "Suite 2703", description: "Building A 27th Floor Suite", code: "FL_27_Cherry")
suite2704 = Product.create(name: "Suite 2704", description: "Building A 27th Floor Suite", code: "FL_27_Cypress")
suite2705 = Product.create(name: "Suite 2705", description: "Building A 27th Floor Suite", code: "FL_27_Ginkgo_A")
suite2706 = Product.create(name: "Suite 2706", description: "Building A 27th Floor Suite", code: "FL_27_Ginkgo_B")
suite2707 = Product.create(name: "Suite 2707", description: "Building A 27th Floor Suite", code: "FL_27_Peony")
suite2708 = Product.create(name: "Suite 2708", description: "Building A 27th Floor Suite", code: "FL_27_Plum_A")
suite2709 = Product.create(name: "Suite 2709", description: "Building A 27th Floor Suite", code: "FL_27_Plum_B")
suite2710 = Product.create(name: "Suite 2710", description: "Building A 27th Floor Suite", code: "FL_27_Redwood")
suite2711 = Product.create(name: "Suite 2711", description: "Building A 27th Floor Suite", code: "FL_27_Spruce")
    
###Floor 28
suite2801 = Product.create(name: "Suite 2801", description: "Building A 28th Floor Suite", code: "FL_28_Bamboo")
suite2802 = Product.create(name: "Suite 2802", description: "Building A 28th Floor Suite", code: "FL_28_Burnet")
suite2803 = Product.create(name: "Suite 2803", description: "Building A 28th Floor Suite", code: "FL_28_Cherry")
suite2804 = Product.create(name: "Suite 2804", description: "Building A 28th Floor Suite", code: "FL_28_Cypress")
suite2805 = Product.create(name: "Suite 2805", description: "Building A 28th Floor Suite", code: "FL_28_Ginkgo_A")
suite2806 = Product.create(name: "Suite 2806", description: "Building A 28th Floor Suite", code: "FL_28_Ginkgo_B")
suite2807 = Product.create(name: "Suite 2807", description: "Building A 28th Floor Suite", code: "FL_28_Peony")
suite2808 = Product.create(name: "Suite 2808", description: "Building A 28th Floor Suite", code: "FL_28_Plum_A")
suite2809 = Product.create(name: "Suite 2809", description: "Building A 28th Floor Suite", code: "FL_28_Plum_B")
suite2810 = Product.create(name: "Suite 2810", description: "Building A 28th Floor Suite", code: "FL_28_Redwood")
suite2811 = Product.create(name: "Suite 2811", description: "Building A 28th Floor Suite", code: "FL_28_Spruce")
    
###Floor 29
suite2901 = Product.create(name: "Suite 2901", description: "Building A 29th Floor Suite", code: "FL_29_Bamboo")
suite2902 = Product.create(name: "Suite 2902", description: "Building A 29th Floor Suite", code: "FL_29_Burnet")
suite2903 = Product.create(name: "Suite 2903", description: "Building A 29th Floor Suite", code: "FL_29_Cherry")
suite2904 = Product.create(name: "Suite 2904", description: "Building A 29th Floor Suite", code: "FL_29_Cypress")
suite2905 = Product.create(name: "Suite 2905", description: "Building A 29th Floor Suite", code: "FL_29_Ginkgo_A")
suite2906 = Product.create(name: "Suite 2906", description: "Building A 29th Floor Suite", code: "FL_29_Ginkgo_B")
suite2907 = Product.create(name: "Suite 2907", description: "Building A 29th Floor Suite", code: "FL_29_Peony")
suite2908 = Product.create(name: "Suite 2908", description: "Building A 29th Floor Suite", code: "FL_29_Plum_A")
suite2909 = Product.create(name: "Suite 2909", description: "Building A 29th Floor Suite", code: "FL_29_Plum_B")
suite2910 = Product.create(name: "Suite 2910", description: "Building A 29th Floor Suite", code: "FL_29_Redwood")
suite2911 = Product.create(name: "Suite 2911", description: "Building A 29th Floor Suite", code: "FL_29_Spruce")
    
###Floor 30
suite3001 = Product.create(name: "Suite 3001", description: "Building A 30th Floor Suite", code: "FL_30_Bamboo")
suite3002 = Product.create(name: "Suite 3002", description: "Building A 30th Floor Suite", code: "FL_30_Burnet")
suite3003 = Product.create(name: "Suite 3003", description: "Building A 30th Floor Suite", code: "FL_30_Cherry")
suite3004 = Product.create(name: "Suite 3004", description: "Building A 30th Floor Suite", code: "FL_30_Cypress")
suite3005 = Product.create(name: "Suite 3005", description: "Building A 30th Floor Suite", code: "FL_30_Ginkgo_A")
suite3006 = Product.create(name: "Suite 3006", description: "Building A 30th Floor Suite", code: "FL_30_Ginkgo_B")
suite3007 = Product.create(name: "Suite 3007", description: "Building A 30th Floor Suite", code: "FL_30_Peony")
suite3008 = Product.create(name: "Suite 3008", description: "Building A 30th Floor Suite", code: "FL_30_Plum_A")
suite3009 = Product.create(name: "Suite 3009", description: "Building A 30th Floor Suite", code: "FL_30_Plum_B")
suite3010 = Product.create(name: "Suite 3010", description: "Building A 30th Floor Suite", code: "FL_30_Redwood")
suite3011 = Product.create(name: "Suite 3011", description: "Building A 30th Floor Suite", code: "FL_30_Spruce")

###Floor 31
suite3101 = Product.create(name: "Suite 3101", description: "Building A 31th Floor Suite", code: "FL_31_Bamboo")
suite3102 = Product.create(name: "Suite 3102", description: "Building A 31th Floor Suite", code: "FL_31_Burnet")
suite3103 = Product.create(name: "Suite 3103", description: "Building A 31th Floor Suite", code: "FL_31_Cherry")
suite3104 = Product.create(name: "Suite 3104", description: "Building A 31th Floor Suite", code: "FL_31_Cypress")
suite3105 = Product.create(name: "Suite 3105", description: "Building A 31th Floor Suite", code: "FL_31_Ginkgo_A")
suite3106 = Product.create(name: "Suite 3106", description: "Building A 31th Floor Suite", code: "FL_31_Ginkgo_B")
suite3107 = Product.create(name: "Suite 3107", description: "Building A 31th Floor Suite", code: "FL_31_Peony")
suite3108 = Product.create(name: "Suite 3108", description: "Building A 31th Floor Suite", code: "FL_31_Plum_A")
suite3109 = Product.create(name: "Suite 3109", description: "Building A 31th Floor Suite", code: "FL_31_Plum_B")
suite3110 = Product.create(name: "Suite 3110", description: "Building A 31th Floor Suite", code: "FL_31_Redwood")
suite3111 = Product.create(name: "Suite 3111", description: "Building A 31th Floor Suite", code: "FL_31_Spruce")

###Floor 32
suite3201 = Product.create(name: "Suite 3201", description: "Building A 32th Floor Suite", code: "FL_32_Bamboo")
suite3202 = Product.create(name: "Suite 3202", description: "Building A 32th Floor Suite", code: "FL_32_Burnet")
suite3203 = Product.create(name: "Suite 3203", description: "Building A 32th Floor Suite", code: "FL_32_Cherry")
suite3204 = Product.create(name: "Suite 3204", description: "Building A 32th Floor Suite", code: "FL_32_Cypress")
suite3205 = Product.create(name: "Suite 3205", description: "Building A 32th Floor Suite", code: "FL_32_Ginkgo_A")
suite3206 = Product.create(name: "Suite 3206", description: "Building A 32th Floor Suite", code: "FL_32_Ginkgo_B")
suite3207 = Product.create(name: "Suite 3207", description: "Building A 32th Floor Suite", code: "FL_32_Peony")
suite3208 = Product.create(name: "Suite 3208", description: "Building A 32th Floor Suite", code: "FL_32_Plum_A")
suite3209 = Product.create(name: "Suite 3209", description: "Building A 32th Floor Suite", code: "FL_32_Plum_B")
suite3210 = Product.create(name: "Suite 3210", description: "Building A 32th Floor Suite", code: "FL_32_Redwood")
suite3211 = Product.create(name: "Suite 3211", description: "Building A 32th Floor Suite", code: "FL_32_Spruce")

###Floor 33
suite3301 = Product.create(name: "Suite 3301", description: "Building A 33th Floor Suite", code: "FL_33_Bamboo")
suite3302 = Product.create(name: "Suite 3302", description: "Building A 33th Floor Suite", code: "FL_33_Burnet")
suite3303 = Product.create(name: "Suite 3303", description: "Building A 33th Floor Suite", code: "FL_33_Cherry")
suite3304 = Product.create(name: "Suite 3304", description: "Building A 33th Floor Suite", code: "FL_33_Cypress")
suite3305 = Product.create(name: "Suite 3305", description: "Building A 33th Floor Suite", code: "FL_33_Ginkgo_A")
suite3306 = Product.create(name: "Suite 3306", description: "Building A 33th Floor Suite", code: "FL_33_Ginkgo_B")
suite3307 = Product.create(name: "Suite 3307", description: "Building A 33th Floor Suite", code: "FL_33_Peony")
suite3308 = Product.create(name: "Suite 3308", description: "Building A 33th Floor Suite", code: "FL_33_Plum_A")
suite3309 = Product.create(name: "Suite 3309", description: "Building A 33th Floor Suite", code: "FL_33_Plum_B")
suite3310 = Product.create(name: "Suite 3310", description: "Building A 33th Floor Suite", code: "FL_33_Redwood")
suite3311 = Product.create(name: "Suite 3311", description: "Building A 33th Floor Suite", code: "FL_33_Spruce")

###Floor 34
suite3401 = Product.create(name: "Suite 3401", description: "Building A 34th Floor Suite", code: "FL_34_Bamboo")
suite3402 = Product.create(name: "Suite 3402", description: "Building A 34th Floor Suite", code: "FL_34_Burnet")
suite3403 = Product.create(name: "Suite 3403", description: "Building A 34th Floor Suite", code: "FL_34_Cherry")
suite3404 = Product.create(name: "Suite 3404", description: "Building A 34th Floor Suite", code: "FL_34_Cypress")
suite3405 = Product.create(name: "Suite 3405", description: "Building A 34th Floor Suite", code: "FL_34_Ginkgo_A")
suite3406 = Product.create(name: "Suite 3406", description: "Building A 34th Floor Suite", code: "FL_34_Ginkgo_B")
suite3407 = Product.create(name: "Suite 3407", description: "Building A 34th Floor Suite", code: "FL_34_Peony")
suite3408 = Product.create(name: "Suite 3408", description: "Building A 34th Floor Suite", code: "FL_34_Plum_A")
suite3409 = Product.create(name: "Suite 3409", description: "Building A 34th Floor Suite", code: "FL_34_Plum_B")
suite3410 = Product.create(name: "Suite 3410", description: "Building A 34th Floor Suite", code: "FL_34_Redwood")
suite3411 = Product.create(name: "Suite 3411", description: "Building A 34th Floor Suite", code: "FL_34_Spruce")

################################################################################################################
#Properties                                                                                                    #
################################################################################################################

availability = Property.create(name: "Availability", description: "Suite Availability", field_type: "boolean")

################################################################################################################
#ValueFields                                                                                                   #
################################################################################################################
            

            B1_3D_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B1_2B_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B1_2B_2FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B1_2B_3FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B1_3C_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B1_2E_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B1_2F_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B1_2A_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
           
            
            #Back
            
            B1_3D_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B1_2B_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B1_2B_2BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B1_2B_3BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B1_3C_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B1_2E_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B1_2F_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B1_2A_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            
            
            ##Block2
            
            #Front
            
            B2_2B_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_2B_2FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_2B_3FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_2B_4FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_3B_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_2A_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_2E_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_2F_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_2A_2FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_3C_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
           
            
            #Back
            
            
            B2_2B_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_2B_2BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_2B_3BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_2B_4BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_3B_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_2A_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_2E_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_2F_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_2A_2BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B2_3C_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
                
            
            
            ##Block3
            
            #Front
            
            B3_2B_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B3_2B_2FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B3_2B_3FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B3_2B_4FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B3_2A_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B3_2E_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B3_2F_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B3_2A_2FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
           
            
            #Back
            
            
            
            B3_2B_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B3_2B_2BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B3_2B_3BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B3_2B_4BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B3_2A_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B3_2E_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B3_2F_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B3_2A_2BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            
        
            
            ##Block4
            
            #Front
            
            B4_2B_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_2B_2FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_2B_3FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_2B_4FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_3B_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_2A_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_2E_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_2F_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_2A_2FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_3C_1FVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
           
            
            #Back
            
            
            B4_2B_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_2B_2BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_2B_3BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_2B_4BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_3B_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_2A_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_2E_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_2F_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_2A_2BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
            B4_3C_1BVF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "")
    
    
    
    

###Floor 5
suite501VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Bamboo")
suite502VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Burnet")
suite503VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Cherry")
suite504VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Cypress")
suite505VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Ginkgo_A")
suite506VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Ginkgo_B")
suite507VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Peony")
suite508VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Plum_A")
suite509VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Plum_B")
suite510VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Redwood")
suite511VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_5_Spruce")
    
###Floor 6
suite601VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_6_Bamboo")
suite602VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_6_Burnet")
suite603VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_6_Cherry")
suite604VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_6_Cypress")
suite605VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_6_Ginkgo_A")
suite606VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_6_Ginkgo_B")
suite607VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_6_Peony")
suite608VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_6_Plum_A")
suite609VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_6_Plum_B")
suite610VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_6_Redwood")
suite611VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_6_Spruce")
    
###Floor 7
suite701VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_7_Bamboo")
suite702VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_7_Burnet")
suite703VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_7_Cherry")
suite704VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_7_Cypress")
suite705VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_7_Ginkgo_A")
suite706VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_7_Ginkgo_B")
suite707VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_7_Peony")
suite708VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_7_Plum_A")
suite709VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_7_Plum_B")
suite710VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_7_Redwood")
suite711VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_7_Spruce")
    
###Floor 8
suite801VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_8_Bamboo")
suite802VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_8_Burnet")
suite803VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_8_Cherry")
suite804VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_8_Cypress")
suite805VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_8_Ginkgo_A")
suite806VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_8_Ginkgo_B")
suite807VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_8_Peony")
suite808VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_8_Plum_A")
suite809VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_8_Plum_B")
suite810VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_8_Redwood")
suite811VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_8_Spruce")
    
###Floor 9
suite901VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_9_Bamboo")
suite902VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_9_Burnet")
suite903VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_9_Cherry")
suite904VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_9_Cypress")
suite905VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_9_Ginkgo_A")
suite906VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_9_Ginkgo_B")
suite907VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_9_Peony")
suite908VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_9_Plum_A")
suite909VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_9_Plum_B")
suite910VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_9_Redwood")
suite911VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_9_Spruce")
    
###Floor 10
suite1001VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_10_Bamboo")
suite1002VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_10_Burnet")
suite1003VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_10_Cherry")
suite1004VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_10_Cypress")
suite1005VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_10_Ginkgo_A")
suite1006VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_10_Ginkgo_B")
suite1007VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_10_Peony")
suite1008VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_10_Plum_A")
suite1009VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_10_Plum_B")
suite1010VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_10_Redwood")
suite1011VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_10_Spruce")
    
###Floor 11
suite1101VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_11_Bamboo")
suite1102VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_11_Burnet")
suite1103VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_11_Cherry")
suite1104VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_11_Cypress")
suite1105VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_11_Ginkgo_A")
suite1106VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_11_Ginkgo_B")
suite1107VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_11_Peony")
suite1108VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_11_Plum_A")
suite1109VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_11_Plum_B")
suite1110VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_11_Redwood")
suite1111VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_11_Spruce")
    
###Floor 12
suite1201VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_12_Bamboo")
suite1202VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_12_Burnet")
suite1203VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_12_Cherry")
suite1204VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_12_Cypress")
suite1205VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_12_Ginkgo_A")
suite1206VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_12_Ginkgo_B")
suite1207VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_12_Peony")
suite1208VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_12_Plum_A")
suite1209VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_12_Plum_B")
suite1210VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_12_Redwood")
suite1211VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_12_Spruce")
    
###Floor 13
suite1301VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_13_Bamboo")
suite1302VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_13_Burnet")
suite1303VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_13_Cherry")
suite1304VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_13_Cypress")
suite1305VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_13_Ginkgo_A")
suite1306VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_13_Ginkgo_B")
suite1307VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_13_Peony")
suite1308VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_13_Plum_A")
suite1309VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_13_Plum_B")
suite1310VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_13_Redwood")
suite1311VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_13_Spruce")
    
###Floor 14
suite1401VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_14_Bamboo")
suite1402VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_14_Burnet")
suite1403VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_14_Cherry")
suite1404VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_14_Cypress")
suite1405VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_14_Ginkgo_A")
suite1406VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_14_Ginkgo_B")
suite1407VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_14_Peony")
suite1408VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_14_Plum_A")
suite1409VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_14_Plum_B")
suite1410VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_14_Redwood")
suite1411VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_14_Spruce")
    
###Floor 15
suite1501VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_15_Bamboo")
suite1502VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_15_Burnet")
suite1503VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_15_Cherry")
suite1504VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_15_Cypress")
suite1505VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_15_Ginkgo_A")
suite1506VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_15_Ginkgo_B")
suite1507VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_15_Peony")
suite1508VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_15_Plum_A")
suite1509VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_15_Plum_B")
suite1510VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_15_Redwood")
suite1511VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_15_Spruce")

###Floor 16
suite1601VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_16_Bamboo")
suite1602VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_16_Burnet")
suite1603VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_16_Cherry")
suite1604VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_16_Cypress")
suite1605VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_16_Ginkgo_A")
suite1606VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_16_Ginkgo_B")
suite1607VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_16_Peony")
suite1608VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_16_Plum_A")
suite1609VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_16_Plum_B")
suite1610VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_16_Redwood")
suite1611VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_16_Spruce")

###Floor 17
suite1701VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_17_Bamboo")
suite1702VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_17_Burnet")
suite1703VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_17_Cherry")
suite1704VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_17_Cypress")
suite1705VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_17_Ginkgo_A")
suite1706VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_17_Ginkgo_B")
suite1707VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_17_Peony")
suite1708VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_17_Plum_A")
suite1709VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_17_Plum_B")
suite1710VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_17_Redwood")
suite1711VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_17_Spruce")

###Floor 18
suite1801VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_18_Bamboo")
suite1802VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_18_Burnet")
suite1803VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_18_Cherry")
suite1804VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_18_Cypress")
suite1805VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_18_Ginkgo_A")
suite1806VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_18_Ginkgo_B")
suite1807VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_18_Peony")
suite1808VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_18_Plum_A")
suite1809VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_18_Plum_B")
suite1810VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_18_Redwood")
suite1811VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_18_Spruce")

###Floor 19
suite1901VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_19_Bamboo")
suite1902VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_19_Burnet")
suite1903VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_19_Cherry")
suite1904VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_19_Cypress")
suite1905VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_19_Ginkgo_A")
suite1906VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_19_Ginkgo_B")
suite1907VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_19_Peony")
suite1908VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_19_Plum_A")
suite1909VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_19_Plum_B")
suite1910VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_19_Redwood")
suite1911VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_19_Spruce")

###Floor 20
suite2001VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_20_Bamboo")
suite2002VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_20_Burnet")
suite2003VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_20_Cherry")
suite2004VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_20_Cypress")
suite2005VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_20_Ginkgo_A")
suite2006VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_20_Ginkgo_B")
suite2007VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_20_Peony")
suite2008VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_20_Plum_A")
suite2009VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_20_Plum_B")
suite2010VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_20_Redwood")
suite2011VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_20_Spruce")
    
###Floor 21
suite2101VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_21_Bamboo")
suite2102VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_21_Burnet")
suite2103VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_21_Cherry")
suite2104VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_21_Cypress")
suite2105VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_21_Ginkgo_A")
suite2106VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_21_Ginkgo_B")
suite2107VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_21_Peony")
suite2108VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_21_Plum_A")
suite2109VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_21_Plum_B")
suite2110VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_21_Redwood")
suite2111VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_21_Spruce")
    
###Floor 22
suite2201VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_22_Bamboo")
suite2202VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_22_Burnet")
suite2203VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_22_Cherry")
suite2204VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_22_Cypress")
suite2205VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_22_Ginkgo_A")
suite2206VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_22_Ginkgo_B")
suite2207VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_22_Peony")
suite2208VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_22_Plum_A")
suite2209VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_22_Plum_B")
suite2210VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_22_Redwood")
suite2211VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_22_Spruce")
    
###Floor 23
suite2301VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_23_Bamboo")
suite2302VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_23_Burnet")
suite2303VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_23_Cherry")
suite2304VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_23_Cypress")
suite2305VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_23_Ginkgo_A")
suite2306VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_23_Ginkgo_B")
suite2307VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_23_Peony")
suite2308VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_23_Plum_A")
suite2309VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_23_Plum_B")
suite2310VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_23_Redwood")
suite2311VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_23_Spruce")

###Floor 24
suite2401VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_24_Bamboo")
suite2402VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_24_Burnet")
suite2403VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_24_Cherry")
suite2404VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_24_Cypress")
suite2405VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_24_Ginkgo_A")
suite2406VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_24_Ginkgo_B")
suite2407VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_24_Peony")
suite2408VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_24_Plum_A")
suite2409VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_24_Plum_B")
suite2410VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_24_Redwood")
suite2411VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_24_Spruce")

###Floor 25
suite2501VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_25_Bamboo")
suite2502VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_25_Burnet")
suite2503VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_25_Cherry")
suite2504VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_25_Cypress")
suite2505VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_25_Ginkgo_A")
suite2506VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_25_Ginkgo_B")
suite2507VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_25_Peony")
suite2508VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_25_Plum_A")
suite2509VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_25_Plum_B")
suite2510VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_25_Redwood")
suite2511VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_25_Spruce")

###Floor 26
suite2601VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_26_Bamboo")
suite2602VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_26_Burnet")
suite2603VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_26_Cherry")
suite2604VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_26_Cypress")
suite2605VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_26_Ginkgo_A")
suite2606VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_26_Ginkgo_B")
suite2607VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_26_Peony")
suite2608VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_26_Plum_A")
suite2609VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_26_Plum_B")
suite2610VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_26_Redwood")
suite2611VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_26_Spruce")
    
###Floor 27
suite2701VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_27_Bamboo")
suite2702VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_27_Burnet")
suite2703VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_27_Cherry")
suite2704VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_27_Cypress")
suite2705VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_27_Ginkgo_A")
suite2706VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_27_Ginkgo_B")
suite2707VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_27_Peony")
suite2708VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_27_Plum_A")
suite2709VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_27_Plum_B")
suite2710VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_27_Redwood")
suite2711VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_27_Spruce")

###Floor 28
suite2801VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_28_Bamboo")
suite2802VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_28_Burnet")
suite2803VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_28_Cherry")
suite2804VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_28_Cypress")
suite2805VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_28_Ginkgo_A")
suite2806VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_28_Ginkgo_B")
suite2807VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_28_Peony")
suite2808VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_28_Plum_A")
suite2809VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_28_Plum_B")
suite2810VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_28_Redwood")
suite2811VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_28_Spruce")
    
###Floor 29
suite2901VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_29_Bamboo")
suite2902VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_29_Burnet")
suite2903VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_29_Cherry")
suite2904VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_29_Cypress")
suite2905VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_29_Ginkgo_A")
suite2906VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_29_Ginkgo_B")
suite2907VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_29_Peony")
suite2908VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_29_Plum_A")
suite2909VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_29_Plum_B")
suite2910VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_29_Redwood")
suite2911VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_29_Spruce")
    
###Floor 30
suite3001VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_30_Bamboo")
suite3002VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_30_Burnet")
suite3003VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_30_Cherry")
suite3004VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_30_Cypress")
suite3005VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_30_Ginkgo_A")
suite3006VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_30_Ginkgo_B")
suite3007VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_30_Peony")
suite3008VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_30_Plum_A")
suite3009VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_30_Plum_B")
suite3010VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_30_Redwood")
suite3011VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_30_Spruce")

###Floor 31
suite3101VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_31_Bamboo")
suite3102VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_31_Burnet")
suite3103VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_31_Cherry")
suite3104VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_31_Cypress")
suite3105VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_31_Ginkgo_A")
suite3106VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_31_Ginkgo_B")
suite3107VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_31_Peony")
suite3108VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_31_Plum_A")
suite3109VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_31_Plum_B")
suite3110VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_31_Redwood")
suite3111VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_31_Spruce")

###Floor 32
suite3201VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_32_Bamboo")
suite3202VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_32_Burnet")
suite3203VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_32_Cherry")
suite3204VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_32_Cypress")
suite3205VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_32_Ginkgo_A")
suite3206VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_32_Ginkgo_B")
suite3207VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_32_Peony")
suite3208VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_32_Plum_A")
suite3209VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_32_Plum_B")
suite3210VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_32_Redwood")
suite3211VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_32_Spruce")

###Floor 33
suite3301VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_33_Bamboo")
suite3302VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_33_Burnet")
suite3303VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_33_Cherry")
suite3304VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_33_Cypress")
suite3305VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_33_Ginkgo_A")
suite3306VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_33_Ginkgo_B")
suite3307VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_33_Peony")
suite3308VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_33_Plum_A")
suite3309VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_33_Plum_B")
suite3310VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_33_Redwood")
suite3311VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_33_Spruce")

###Floor 34
suite3401VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_34_Bamboo")
suite3402VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_34_Burnet")
suite3403VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_34_Cherry")
suite3404VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_34_Cypress")
suite3405VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_34_Ginkgo_A")
suite3406VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_34_Ginkgo_B")
suite3407VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_34_Peony")
suite3408VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_34_Plum_A")
suite3409VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_34_Plum_B")
suite3410VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_34_Redwood")
suite3411VF = Valuefield.create(fieldvalue: "true", property_id: availability.id, code: "FL_34_Spruce")


################################################################################################################
#Properties_Products - association table                                                                       #
################################################################################################################
   


    B1_3D_1F.properties = [availability]
    B1_2B_1F.properties = [availability]
    B1_2B_2F.properties = [availability]
    B1_2B_3F.properties = [availability]
    B1_3C_1F.properties = [availability]
    B1_2E_1F.properties = [availability]
    B1_2F_1F.properties = [availability]
    B1_2A_1F.properties = [availability]
   
    
    #Back
    
    B1_3D_1B.properties = [availability]
    B1_2B_1B.properties = [availability]
    B1_2B_2B.properties = [availability]
    B1_2B_3B.properties = [availability]
    B1_3C_1B.properties = [availability]
    B1_2E_1B.properties = [availability]
    B1_2F_1B.properties = [availability]
    B1_2A_1B.properties = [availability]
    
    
    ##Block2
    
    #Front
    
    B2_2B_1F.properties = [availability]
    B2_2B_2F.properties = [availability]
    B2_2B_3F.properties = [availability]
    B2_2B_4F.properties = [availability]
    B2_3B_1F.properties = [availability]
    B2_2A_1F.properties = [availability]
    B2_2E_1F.properties = [availability]
    B2_2F_1F.properties = [availability]
    B2_2A_2F.properties = [availability]
    B2_3C_1F.properties = [availability]
   
    
    #Back
    
    
    B2_2B_1B.properties = [availability]
    B2_2B_2B.properties = [availability]
    B2_2B_3B.properties = [availability]
    B2_2B_4B.properties = [availability]
    B2_3B_1B.properties = [availability]
    B2_2A_1B.properties = [availability]
    B2_2E_1B.properties = [availability]
    B2_2F_1B.properties = [availability]
    B2_2A_2B.properties = [availability]
    B2_3C_1B.properties = [availability]
        
    
    
    ##Block3
    
    #Front
    
    B3_2B_1F.properties = [availability]
    B3_2B_2F.properties = [availability]
    B3_2B_3F.properties = [availability]
    B3_2B_4F.properties = [availability]
    B3_2A_1F.properties = [availability]
    B3_2E_1F.properties = [availability]
    B3_2F_1F.properties = [availability]
    B3_2A_2F.properties = [availability]
   
    
    #Back
    
    
    
    B3_2B_1B.properties = [availability]
    B3_2B_2B.properties = [availability]
    B3_2B_3B.properties = [availability]
    B3_2B_4B.properties = [availability]
    B3_2A_1B.properties = [availability]
    B3_2E_1B.properties = [availability]
    B3_2F_1B.properties = [availability]
    B3_2A_2B.properties = [availability]
    

    
    ##Block4
    
    #Front
    
    B4_2B_1F.properties = [availability]
    B4_2B_2F.properties = [availability]
    B4_2B_3F.properties = [availability]
    B4_2B_4F.properties = [availability]
    B4_3B_1F.properties = [availability]
    B4_2A_1F.properties = [availability]
    B4_2E_1F.properties = [availability]
    B4_2F_1F.properties = [availability]
    B4_2A_2F.properties = [availability]
    B4_3C_1F.properties = [availability]
   
    
    #Back
    
    
    B4_2B_1B.properties = [availability]
    B4_2B_2B.properties = [availability]
    B4_2B_3B.properties = [availability]
    B4_2B_4B.properties = [availability]
    B4_3B_1B.properties = [availability]
    B4_2A_1B.properties = [availability]
    B4_2E_1B.properties = [availability]
    B4_2F_1B.properties = [availability]
    B4_2A_2B.properties = [availability]
    B4_3C_1B.properties = [availability]
    
    
    
    
    

###Floor 5
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
    
###Floor 6
suite601.properties = [availability]
suite602.properties = [availability]
suite603.properties = [availability]
suite604.properties = [availability]
suite605.properties = [availability]
suite606.properties = [availability]
suite607.properties = [availability]
suite608.properties = [availability]
suite609.properties = [availability]
suite610.properties = [availability]
suite611.properties = [availability]
    
###Floor 7
suite701.properties = [availability]
suite702.properties = [availability]
suite703.properties = [availability]
suite704.properties = [availability]
suite705.properties = [availability]
suite706.properties = [availability]
suite707.properties = [availability]
suite708.properties = [availability]
suite709.properties = [availability]
suite710.properties = [availability]
suite711.properties = [availability]

###Floor 8
suite801.properties = [availability]
suite802.properties = [availability]
suite803.properties = [availability]
suite804.properties = [availability]
suite805.properties = [availability]
suite806.properties = [availability]
suite807.properties = [availability]
suite808.properties = [availability]
suite809.properties = [availability]
suite810.properties = [availability]
suite811.properties = [availability]

###Floor 9
suite901.properties = [availability]
suite902.properties = [availability]
suite903.properties = [availability]
suite904.properties = [availability]
suite905.properties = [availability]
suite906.properties = [availability]
suite907.properties = [availability]
suite908.properties = [availability]
suite909.properties = [availability]
suite910.properties = [availability]
suite911.properties = [availability]

###Floor 10
suite1001.properties = [availability]
suite1002.properties = [availability]
suite1003.properties = [availability]
suite1004.properties = [availability]
suite1005.properties = [availability]
suite1006.properties = [availability]
suite1007.properties = [availability]
suite1008.properties = [availability]
suite1009.properties = [availability]
suite1010.properties = [availability]
suite1011.properties = [availability]

###Floor 11
suite1101.properties = [availability]
suite1102.properties = [availability]
suite1103.properties = [availability]
suite1104.properties = [availability]
suite1105.properties = [availability]
suite1106.properties = [availability]
suite1107.properties = [availability]
suite1108.properties = [availability]
suite1109.properties = [availability]
suite1110.properties = [availability]
suite1111.properties = [availability]

###Floor 12
suite1201.properties = [availability]
suite1202.properties = [availability]
suite1203.properties = [availability]
suite1204.properties = [availability]
suite1205.properties = [availability]
suite1206.properties = [availability]
suite1207.properties = [availability]
suite1208.properties = [availability]
suite1209.properties = [availability]
suite1210.properties = [availability]
suite1211.properties = [availability]

###Floor 13
suite1301.properties = [availability]
suite1302.properties = [availability]
suite1303.properties = [availability]
suite1304.properties = [availability]
suite1305.properties = [availability]
suite1306.properties = [availability]
suite1307.properties = [availability]
suite1308.properties = [availability]
suite1309.properties = [availability]
suite1310.properties = [availability]
suite1311.properties = [availability]

###Floor 14
suite1401.properties = [availability]
suite1402.properties = [availability]
suite1403.properties = [availability]
suite1404.properties = [availability]
suite1405.properties = [availability]
suite1406.properties = [availability]
suite1407.properties = [availability]
suite1408.properties = [availability]
suite1409.properties = [availability]
suite1410.properties = [availability]
suite1411.properties = [availability]

###Floor 15
suite1501.properties = [availability]
suite1502.properties = [availability]
suite1503.properties = [availability]
suite1504.properties = [availability]
suite1505.properties = [availability]
suite1506.properties = [availability]
suite1507.properties = [availability]
suite1508.properties = [availability]
suite1509.properties = [availability]
suite1510.properties = [availability]
suite1511.properties = [availability]

###Floor 16
suite1601.properties = [availability]
suite1602.properties = [availability]
suite1603.properties = [availability]
suite1604.properties = [availability]
suite1605.properties = [availability]
suite1606.properties = [availability]
suite1607.properties = [availability]
suite1608.properties = [availability]
suite1609.properties = [availability]
suite1610.properties = [availability]
suite1611.properties = [availability]

###Floor 17
suite1701.properties = [availability]
suite1702.properties = [availability]
suite1703.properties = [availability]
suite1704.properties = [availability]
suite1705.properties = [availability]
suite1706.properties = [availability]
suite1707.properties = [availability]
suite1708.properties = [availability]
suite1709.properties = [availability]
suite1710.properties = [availability]
suite1711.properties = [availability]

###Floor 18
suite1801.properties = [availability]
suite1802.properties = [availability]
suite1803.properties = [availability]
suite1804.properties = [availability]
suite1805.properties = [availability]
suite1806.properties = [availability]
suite1807.properties = [availability]
suite1808.properties = [availability]
suite1809.properties = [availability]
suite1810.properties = [availability]
suite1811.properties = [availability]

###Floor 19
suite1901.properties = [availability]
suite1902.properties = [availability]
suite1903.properties = [availability]
suite1904.properties = [availability]
suite1905.properties = [availability]
suite1906.properties = [availability]
suite1907.properties = [availability]
suite1908.properties = [availability]
suite1909.properties = [availability]
suite1910.properties = [availability]
suite1911.properties = [availability]
    
###Floor 20
suite2001.properties = [availability]
suite2002.properties = [availability]
suite2003.properties = [availability]
suite2004.properties = [availability]
suite2005.properties = [availability]
suite2006.properties = [availability]
suite2007.properties = [availability]
suite2008.properties = [availability]
suite2009.properties = [availability]
suite2010.properties = [availability]
suite2011.properties = [availability]

###Floor 21
suite2101.properties = [availability]
suite2102.properties = [availability]
suite2103.properties = [availability]
suite2104.properties = [availability]
suite2105.properties = [availability]
suite2106.properties = [availability]
suite2107.properties = [availability]
suite2108.properties = [availability]
suite2109.properties = [availability]
suite2110.properties = [availability]
suite2111.properties = [availability]

###Floor 22
suite2201.properties = [availability]
suite2202.properties = [availability]
suite2203.properties = [availability]
suite2204.properties = [availability]
suite2205.properties = [availability]
suite2206.properties = [availability]
suite2207.properties = [availability]
suite2208.properties = [availability]
suite2209.properties = [availability]
suite2210.properties = [availability]
suite2211.properties = [availability]

###Floor 23
suite2301.properties = [availability]
suite2302.properties = [availability]
suite2303.properties = [availability]
suite2304.properties = [availability]
suite2305.properties = [availability]
suite2306.properties = [availability]
suite2307.properties = [availability]
suite2308.properties = [availability]
suite2309.properties = [availability]
suite2310.properties = [availability]
suite2311.properties = [availability]

###Floor 24
suite2401.properties = [availability]
suite2402.properties = [availability]
suite2403.properties = [availability]
suite2404.properties = [availability]
suite2405.properties = [availability]
suite2406.properties = [availability]
suite2407.properties = [availability]
suite2408.properties = [availability]
suite2409.properties = [availability]
suite2410.properties = [availability]
suite2411.properties = [availability]

###Floor 25
suite2501.properties = [availability]
suite2502.properties = [availability]
suite2503.properties = [availability]
suite2504.properties = [availability]
suite2505.properties = [availability]
suite2506.properties = [availability]
suite2507.properties = [availability]
suite2508.properties = [availability]
suite2509.properties = [availability]
suite2510.properties = [availability]
suite2511.properties = [availability]
    
###Floor 26
suite2601.properties = [availability]
suite2602.properties = [availability]
suite2603.properties = [availability]
suite2604.properties = [availability]
suite2605.properties = [availability]
suite2606.properties = [availability]
suite2607.properties = [availability]
suite2608.properties = [availability]
suite2609.properties = [availability]
suite2610.properties = [availability]
suite2611.properties = [availability]

###Floor 27
suite2701.properties = [availability]
suite2702.properties = [availability]
suite2703.properties = [availability]
suite2704.properties = [availability]
suite2705.properties = [availability]
suite2706.properties = [availability]
suite2707.properties = [availability]
suite2708.properties = [availability]
suite2709.properties = [availability]
suite2710.properties = [availability]
suite2711.properties = [availability]

###Floor 28
suite2801.properties = [availability]
suite2802.properties = [availability]
suite2803.properties = [availability]
suite2804.properties = [availability]
suite2805.properties = [availability]
suite2806.properties = [availability]
suite2807.properties = [availability]
suite2808.properties = [availability]
suite2809.properties = [availability]
suite2810.properties = [availability]
suite2811.properties = [availability]

###Floor 29
suite2901.properties = [availability]
suite2902.properties = [availability]
suite2903.properties = [availability]
suite2904.properties = [availability]
suite2905.properties = [availability]
suite2906.properties = [availability]
suite2907.properties = [availability]
suite2908.properties = [availability]
suite2909.properties = [availability]
suite2910.properties = [availability]
suite2911.properties = [availability]

###Floor 30
suite3001.properties = [availability]
suite3002.properties = [availability]
suite3003.properties = [availability]
suite3004.properties = [availability]
suite3005.properties = [availability]
suite3006.properties = [availability]
suite3007.properties = [availability]
suite3008.properties = [availability]
suite3009.properties = [availability]
suite3010.properties = [availability]
suite3011.properties = [availability]

###Floor 31
suite3101.properties = [availability]
suite3102.properties = [availability]
suite3103.properties = [availability]
suite3104.properties = [availability]
suite3105.properties = [availability]
suite3106.properties = [availability]
suite3107.properties = [availability]
suite3108.properties = [availability]
suite3109.properties = [availability]
suite3110.properties = [availability]
suite3111.properties = [availability]

###Floor 32
suite3201.properties = [availability]
suite3202.properties = [availability]
suite3203.properties = [availability]
suite3204.properties = [availability]
suite3205.properties = [availability]
suite3206.properties = [availability]
suite3207.properties = [availability]
suite3208.properties = [availability]
suite3209.properties = [availability]
suite3210.properties = [availability]
suite3211.properties = [availability]

###Floor 33
suite3301.properties = [availability]
suite3302.properties = [availability]
suite3303.properties = [availability]
suite3304.properties = [availability]
suite3305.properties = [availability]
suite3306.properties = [availability]
suite3307.properties = [availability]
suite3308.properties = [availability]
suite3309.properties = [availability]
suite3310.properties = [availability]
suite3311.properties = [availability]

###Floor 34
suite3401.properties = [availability]
suite3402.properties = [availability]
suite3403.properties = [availability]
suite3404.properties = [availability]
suite3405.properties = [availability]
suite3406.properties = [availability]
suite3407.properties = [availability]
suite3408.properties = [availability]
suite3409.properties = [availability]
suite3410.properties = [availability]
suite3411.properties = [availability]


################################################################################################################
#Valuefields_Products - association table                                                                      #
################################################################################################################


     B1_3D_1F.valuefields = [B1_3D_1FVF]
    B1_2B_1F.valuefields = [B1_2B_1FVF]
    B1_2B_2F.valuefields = [B1_2B_2FVF]
    B1_2B_3F.valuefields = [B1_2B_3FVF]
    B1_3C_1F.valuefields = [B1_3C_1FVF]
    B1_2E_1F.valuefields = [B1_2E_1FVF]
    B1_2F_1F.valuefields = [B1_2F_1FVF]
    B1_2A_1F.valuefields = [B1_2A_1FVF]
   
    
    #Back
    
    B1_3D_1B.valuefields = [B1_3D_1BVF]
    B1_2B_1B.valuefields = [B1_2B_1BVF]
    B1_2B_2B.valuefields = [B1_2B_2BVF]
    B1_2B_3B.valuefields = [B1_2B_3BVF]
    B1_3C_1B.valuefields = [B1_3C_1BVF]
    B1_2E_1B.valuefields = [B1_2E_1BVF]
    B1_2F_1B.valuefields = [B1_2F_1BVF]
    B1_2A_1B.valuefields = [B1_2A_1BVF]
    
    
    ##Block2
    
    #Front
    
    B2_2B_1F.valuefields = [B2_2B_1FVF]
    B2_2B_2F.valuefields = [B2_2B_2FVF]
    B2_2B_3F.valuefields = [B2_2B_3FVF]
    B2_2B_4F.valuefields = [B2_2B_4FVF]
    B2_3B_1F.valuefields = [B2_3B_1FVF]
    B2_2A_1F.valuefields = [B2_2A_1FVF]
    B2_2E_1F.valuefields = [B2_2E_1FVF]
    B2_2F_1F.valuefields = [B2_2F_1FVF]
    B2_2A_2F.valuefields = [B2_2A_2FVF]
    B2_3C_1F.valuefields = [B2_3C_1FVF]
   
    
    #Back
    
    
    B2_2B_1B.valuefields = [B2_2B_1BVF]
    B2_2B_2B.valuefields = [B2_2B_2BVF]
    B2_2B_3B.valuefields = [B2_2B_3BVF]
    B2_2B_4B.valuefields = [B2_2B_4BVF]
    B2_3B_1B.valuefields = [B2_3B_1BVF]
    B2_2A_1B.valuefields = [B2_2A_1BVF]
    B2_2E_1B.valuefields = [B2_2E_1BVF]
    B2_2F_1B.valuefields = [B2_2F_1BVF]
    B2_2A_2B.valuefields = [B2_2A_2BVF]
    B2_3C_1B.valuefields = [B2_3C_1BVF]
        
    
    
    ##Block3
    
    #Front
    
    B3_2B_1F.valuefields = [B3_2B_1FVF]
    B3_2B_2F.valuefields = [B3_2B_2FVF]
    B3_2B_3F.valuefields = [B3_2B_3FVF]
    B3_2B_4F.valuefields = [B3_2B_4FVF]
    B3_2A_1F.valuefields = [B3_2A_1FVF]
    B3_2E_1F.valuefields = [B3_2E_1FVF]
    B3_2F_1F.valuefields = [B3_2F_1FVF]
    B3_2A_2F.valuefields = [B3_2A_2FVF]
   
    
    #Back
    
    
    
    B3_2B_1B.valuefields = [B3_2B_1BVF]
    B3_2B_2B.valuefields = [B3_2B_2BVF]
    B3_2B_3B.valuefields = [B3_2B_3BVF]
    B3_2B_4B.valuefields = [B3_2B_4BVF]
    B3_2A_1B.valuefields = [B3_2A_1BVF]
    B3_2E_1B.valuefields = [B3_2E_1BVF]
    B3_2F_1B.valuefields = [B3_2F_1BVF]
    B3_2A_2B.valuefields = [B3_2A_2BVF]
    

    
    ##Block4
    
    #Front
    
    B4_2B_1F.valuefields = [B4_2B_1FVF]
    B4_2B_2F.valuefields = [B4_2B_2FVF]
    B4_2B_3F.valuefields = [B4_2B_3FVF]
    B4_2B_4F.valuefields = [B4_2B_4FVF]
    B4_3B_1F.valuefields = [B4_3B_1FVF]
    B4_2A_1F.valuefields = [B4_2A_1FVF]
    B4_2E_1F.valuefields = [B4_2E_1FVF]
    B4_2F_1F.valuefields = [B4_2F_1FVF]
    B4_2A_2F.valuefields = [B4_2A_2FVF]
    B4_3C_1F.valuefields = [B4_3C_1FVF]
   
    
    #Back
    
    
    B4_2B_1B.valuefields = [B4_2B_1BVF]
    B4_2B_2B.valuefields = [B4_2B_2BVF]
    B4_2B_3B.valuefields = [B4_2B_3BVF]
    B4_2B_4B.valuefields = [B4_2B_4BVF]
    B4_3B_1B.valuefields = [B4_3B_1BVF]
    B4_2A_1B.valuefields = [B4_2A_1BVF]
    B4_2E_1B.valuefields = [B4_2E_1BVF]
    B4_2F_1B.valuefields = [B4_2F_1BVF]
    B4_2A_2B.valuefields = [B4_2A_2BVF]
    B4_3C_1B.valuefields = [B4_3C_1BVF]
    
    
    

###Floor 5
suite501.valuefields = [suite501VF]
suite502.valuefields = [suite502VF]
suite503.valuefields = [suite503VF]
suite504.valuefields = [suite504VF]
suite505.valuefields = [suite505VF]
suite506.valuefields = [suite506VF]
suite507.valuefields = [suite507VF]
suite508.valuefields = [suite508VF]
suite509.valuefields = [suite509VF]
suite510.valuefields = [suite510VF]
suite511.valuefields = [suite511VF]
    
###Floor 6
suite601.valuefields = [suite601VF]
suite602.valuefields = [suite602VF]
suite603.valuefields = [suite603VF]
suite604.valuefields = [suite604VF]
suite605.valuefields = [suite605VF]
suite606.valuefields = [suite606VF]
suite607.valuefields = [suite607VF]
suite608.valuefields = [suite608VF]
suite609.valuefields = [suite609VF]
suite610.valuefields = [suite610VF]
suite611.valuefields = [suite611VF]
    
###Floor 7
suite701.valuefields = [suite701VF]
suite702.valuefields = [suite702VF]
suite703.valuefields = [suite703VF]
suite704.valuefields = [suite704VF]
suite705.valuefields = [suite705VF]
suite706.valuefields = [suite706VF]
suite707.valuefields = [suite707VF]
suite708.valuefields = [suite708VF]
suite709.valuefields = [suite709VF]
suite710.valuefields = [suite710VF]
suite711.valuefields = [suite711VF]
    
###Floor 8
suite801.valuefields = [suite801VF]
suite802.valuefields = [suite802VF]
suite803.valuefields = [suite803VF]
suite804.valuefields = [suite804VF]
suite805.valuefields = [suite805VF]
suite806.valuefields = [suite806VF]
suite807.valuefields = [suite807VF]
suite808.valuefields = [suite808VF]
suite809.valuefields = [suite809VF]
suite810.valuefields = [suite810VF]
suite811.valuefields = [suite811VF]
    
###Floor 9
suite901.valuefields = [suite901VF]
suite902.valuefields = [suite902VF]
suite903.valuefields = [suite903VF]
suite904.valuefields = [suite904VF]
suite905.valuefields = [suite905VF]
suite906.valuefields = [suite906VF]
suite907.valuefields = [suite907VF]
suite908.valuefields = [suite908VF]
suite909.valuefields = [suite909VF]
suite910.valuefields = [suite910VF]
suite911.valuefields = [suite911VF]
    
###Floor 10
suite1001.valuefields = [suite1001VF]
suite1002.valuefields = [suite1002VF]
suite1003.valuefields = [suite1003VF]
suite1004.valuefields = [suite1004VF]
suite1005.valuefields = [suite1005VF]
suite1006.valuefields = [suite1006VF]
suite1007.valuefields = [suite1007VF]
suite1008.valuefields = [suite1008VF]
suite1009.valuefields = [suite1009VF]
suite1010.valuefields = [suite1010VF]
suite1011.valuefields = [suite1011VF]
    
###Floor 11
suite1101.valuefields = [suite1101VF]
suite1102.valuefields = [suite1102VF]
suite1103.valuefields = [suite1103VF]
suite1104.valuefields = [suite1104VF]
suite1105.valuefields = [suite1105VF]
suite1106.valuefields = [suite1106VF]
suite1107.valuefields = [suite1107VF]
suite1108.valuefields = [suite1108VF]
suite1109.valuefields = [suite1109VF]
suite1110.valuefields = [suite1110VF]
suite1111.valuefields = [suite1111VF]
    
###Floor 12
suite1201.valuefields = [suite1201VF]
suite1202.valuefields = [suite1202VF]
suite1203.valuefields = [suite1203VF]
suite1204.valuefields = [suite1204VF]
suite1205.valuefields = [suite1205VF]
suite1206.valuefields = [suite1206VF]
suite1207.valuefields = [suite1207VF]
suite1208.valuefields = [suite1208VF]
suite1209.valuefields = [suite1209VF]
suite1210.valuefields = [suite1210VF]
suite1211.valuefields = [suite1211VF]
    
###Floor 13
suite1301.valuefields = [suite1301VF]
suite1302.valuefields = [suite1302VF]
suite1303.valuefields = [suite1303VF]
suite1304.valuefields = [suite1304VF]
suite1305.valuefields = [suite1305VF]
suite1306.valuefields = [suite1306VF]
suite1307.valuefields = [suite1307VF]
suite1308.valuefields = [suite1308VF]
suite1309.valuefields = [suite1309VF]
suite1310.valuefields = [suite1310VF]
suite1311.valuefields = [suite1311VF]
    
###Floor 14
suite1401.valuefields = [suite1401VF]
suite1402.valuefields = [suite1402VF]
suite1403.valuefields = [suite1403VF]
suite1404.valuefields = [suite1404VF]
suite1405.valuefields = [suite1405VF]
suite1406.valuefields = [suite1406VF]
suite1407.valuefields = [suite1407VF]
suite1408.valuefields = [suite1408VF]
suite1409.valuefields = [suite1409VF]
suite1410.valuefields = [suite1410VF]
suite1411.valuefields = [suite1411VF]
    
###Floor 15
suite1501.valuefields = [suite1501VF]
suite1502.valuefields = [suite1502VF]
suite1503.valuefields = [suite1503VF]
suite1504.valuefields = [suite1504VF]
suite1505.valuefields = [suite1505VF]
suite1506.valuefields = [suite1506VF]
suite1507.valuefields = [suite1507VF]
suite1508.valuefields = [suite1508VF]
suite1509.valuefields = [suite1509VF]
suite1510.valuefields = [suite1510VF]
suite1511.valuefields = [suite1511VF]
    
###Floor 16
suite1601.valuefields = [suite1601VF]
suite1602.valuefields = [suite1602VF]
suite1603.valuefields = [suite1603VF]
suite1604.valuefields = [suite1604VF]
suite1605.valuefields = [suite1605VF]
suite1606.valuefields = [suite1606VF]
suite1607.valuefields = [suite1607VF]
suite1608.valuefields = [suite1608VF]
suite1609.valuefields = [suite1609VF]
suite1610.valuefields = [suite1610VF]
suite1611.valuefields = [suite1611VF]
    
###Floor 17
suite1701.valuefields = [suite1701VF]
suite1702.valuefields = [suite1702VF]
suite1703.valuefields = [suite1703VF]
suite1704.valuefields = [suite1704VF]
suite1705.valuefields = [suite1705VF]
suite1706.valuefields = [suite1706VF]
suite1707.valuefields = [suite1707VF]
suite1708.valuefields = [suite1708VF]
suite1709.valuefields = [suite1709VF]
suite1710.valuefields = [suite1710VF]
suite1711.valuefields = [suite1711VF]
    
###Floor 18
suite1801.valuefields = [suite1801VF]
suite1802.valuefields = [suite1802VF]
suite1803.valuefields = [suite1803VF]
suite1804.valuefields = [suite1804VF]
suite1805.valuefields = [suite1805VF]
suite1806.valuefields = [suite1806VF]
suite1807.valuefields = [suite1807VF]
suite1808.valuefields = [suite1808VF]
suite1809.valuefields = [suite1809VF]
suite1810.valuefields = [suite1810VF]
suite1811.valuefields = [suite1811VF]
    
###Floor 19
suite1901.valuefields = [suite1901VF]
suite1902.valuefields = [suite1902VF]
suite1903.valuefields = [suite1903VF]
suite1904.valuefields = [suite1904VF]
suite1905.valuefields = [suite1905VF]
suite1906.valuefields = [suite1906VF]
suite1907.valuefields = [suite1907VF]
suite1908.valuefields = [suite1908VF]
suite1909.valuefields = [suite1909VF]
suite1910.valuefields = [suite1910VF]
suite1911.valuefields = [suite1911VF]
    
###Floor 20
suite2001.valuefields = [suite2001VF]
suite2002.valuefields = [suite2002VF]
suite2003.valuefields = [suite2003VF]
suite2004.valuefields = [suite2004VF]
suite2005.valuefields = [suite2005VF]
suite2006.valuefields = [suite2006VF]
suite2007.valuefields = [suite2007VF]
suite2008.valuefields = [suite2008VF]
suite2009.valuefields = [suite2009VF]
suite2010.valuefields = [suite2010VF]
suite2011.valuefields = [suite2011VF]
    
###Floor 21
suite2101.valuefields = [suite2101VF]
suite2102.valuefields = [suite2102VF]
suite2103.valuefields = [suite2103VF]
suite2104.valuefields = [suite2104VF]
suite2105.valuefields = [suite2105VF]
suite2106.valuefields = [suite2106VF]
suite2107.valuefields = [suite2107VF]
suite2108.valuefields = [suite2108VF]
suite2109.valuefields = [suite2109VF]
suite2110.valuefields = [suite2110VF]
suite2111.valuefields = [suite2111VF]
    
###Floor 22
suite2201.valuefields = [suite2201VF]
suite2202.valuefields = [suite2202VF]
suite2203.valuefields = [suite2203VF]
suite2204.valuefields = [suite2204VF]
suite2205.valuefields = [suite2205VF]
suite2206.valuefields = [suite2206VF]
suite2207.valuefields = [suite2207VF]
suite2208.valuefields = [suite2208VF]
suite2209.valuefields = [suite2209VF]
suite2210.valuefields = [suite2210VF]
suite2211.valuefields = [suite2211VF]
    
###Floor 23
suite2301.valuefields = [suite2301VF]
suite2302.valuefields = [suite2302VF]
suite2303.valuefields = [suite2303VF]
suite2304.valuefields = [suite2304VF]
suite2305.valuefields = [suite2305VF]
suite2306.valuefields = [suite2306VF]
suite2307.valuefields = [suite2307VF]
suite2308.valuefields = [suite2308VF]
suite2309.valuefields = [suite2309VF]
suite2310.valuefields = [suite2310VF]
suite2311.valuefields = [suite2311VF]
    
###Floor 24
suite2401.valuefields = [suite2401VF]
suite2402.valuefields = [suite2402VF]
suite2403.valuefields = [suite2403VF]
suite2404.valuefields = [suite2404VF]
suite2405.valuefields = [suite2405VF]
suite2406.valuefields = [suite2406VF]
suite2407.valuefields = [suite2407VF]
suite2408.valuefields = [suite2408VF]
suite2409.valuefields = [suite2409VF]
suite2410.valuefields = [suite2410VF]
suite2411.valuefields = [suite2411VF]
    
###Floor 25
suite2501.valuefields = [suite2501VF]
suite2502.valuefields = [suite2502VF]
suite2503.valuefields = [suite2503VF]
suite2504.valuefields = [suite2504VF]
suite2505.valuefields = [suite2505VF]
suite2506.valuefields = [suite2506VF]
suite2507.valuefields = [suite2507VF]
suite2508.valuefields = [suite2508VF]
suite2509.valuefields = [suite2509VF]
suite2510.valuefields = [suite2510VF]
suite2511.valuefields = [suite2511VF]
    
###Floor 26
suite2601.valuefields = [suite2601VF]
suite2602.valuefields = [suite2602VF]
suite2603.valuefields = [suite2603VF]
suite2604.valuefields = [suite2604VF]
suite2605.valuefields = [suite2605VF]
suite2606.valuefields = [suite2606VF]
suite2607.valuefields = [suite2607VF]
suite2608.valuefields = [suite2608VF]
suite2609.valuefields = [suite2609VF]
suite2610.valuefields = [suite2610VF]
suite2611.valuefields = [suite2611VF]
    
###Floor 27
suite2701.valuefields = [suite2701VF]
suite2702.valuefields = [suite2702VF]
suite2703.valuefields = [suite2703VF]
suite2704.valuefields = [suite2704VF]
suite2705.valuefields = [suite2705VF]
suite2706.valuefields = [suite2706VF]
suite2707.valuefields = [suite2707VF]
suite2708.valuefields = [suite2708VF]
suite2709.valuefields = [suite2709VF]
suite2710.valuefields = [suite2710VF]
suite2711.valuefields = [suite2711VF]
    
###Floor 28
suite2801.valuefields = [suite2801VF]
suite2802.valuefields = [suite2802VF]
suite2803.valuefields = [suite2803VF]
suite2804.valuefields = [suite2804VF]
suite2805.valuefields = [suite2805VF]
suite2806.valuefields = [suite2806VF]
suite2807.valuefields = [suite2807VF]
suite2808.valuefields = [suite2808VF]
suite2809.valuefields = [suite2809VF]
suite2810.valuefields = [suite2810VF]
suite2811.valuefields = [suite2811VF]
    
###Floor 29
suite2901.valuefields = [suite2901VF]
suite2902.valuefields = [suite2902VF]
suite2903.valuefields = [suite2903VF]
suite2904.valuefields = [suite2904VF]
suite2905.valuefields = [suite2905VF]
suite2906.valuefields = [suite2906VF]
suite2907.valuefields = [suite2907VF]
suite2908.valuefields = [suite2908VF]
suite2909.valuefields = [suite2909VF]
suite2910.valuefields = [suite2910VF]
suite2911.valuefields = [suite2911VF]
    
###Floor 30
suite3001.valuefields = [suite3001VF]
suite3002.valuefields = [suite3002VF]
suite3003.valuefields = [suite3003VF]
suite3004.valuefields = [suite3004VF]
suite3005.valuefields = [suite3005VF]
suite3006.valuefields = [suite3006VF]
suite3007.valuefields = [suite3007VF]
suite3008.valuefields = [suite3008VF]
suite3009.valuefields = [suite3009VF]
suite3010.valuefields = [suite3010VF]
suite3011.valuefields = [suite3011VF]

###Floor 31
suite3101.valuefields = [suite3101VF]
suite3102.valuefields = [suite3102VF]
suite3103.valuefields = [suite3103VF]
suite3104.valuefields = [suite3104VF]
suite3105.valuefields = [suite3105VF]
suite3106.valuefields = [suite3106VF]
suite3107.valuefields = [suite3107VF]
suite3108.valuefields = [suite3108VF]
suite3109.valuefields = [suite3109VF]
suite3110.valuefields = [suite3110VF]
suite3111.valuefields = [suite3111VF]

###Floor 32
suite3201.valuefields = [suite3201VF]
suite3202.valuefields = [suite3202VF]
suite3203.valuefields = [suite3203VF]
suite3204.valuefields = [suite3204VF]
suite3205.valuefields = [suite3205VF]
suite3206.valuefields = [suite3206VF]
suite3207.valuefields = [suite3207VF]
suite3208.valuefields = [suite3208VF]
suite3209.valuefields = [suite3209VF]
suite3210.valuefields = [suite3210VF]
suite3211.valuefields = [suite3211VF]

###Floor 33
suite3301.valuefields = [suite3301VF]
suite3302.valuefields = [suite3302VF]
suite3303.valuefields = [suite3303VF]
suite3304.valuefields = [suite3304VF]
suite3305.valuefields = [suite3305VF]
suite3306.valuefields = [suite3306VF]
suite3307.valuefields = [suite3307VF]
suite3308.valuefields = [suite3308VF]
suite3309.valuefields = [suite3309VF]
suite3310.valuefields = [suite3310VF]
suite3311.valuefields = [suite3311VF]

###Floor 34
suite3401.valuefields = [suite3401VF]
suite3402.valuefields = [suite3402VF]
suite3403.valuefields = [suite3403VF]
suite3404.valuefields = [suite3404VF]
suite3405.valuefields = [suite3405VF]
suite3406.valuefields = [suite3406VF]
suite3407.valuefields = [suite3407VF]
suite3408.valuefields = [suite3408VF]
suite3409.valuefields = [suite3409VF]
suite3410.valuefields = [suite3410VF]
suite3411.valuefields = [suite3411VF]

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
        


buildingA.products = [suite501, suite502, suite503, suite504, suite505, suite506, suite507, suite508, suite509, suite510, suite511, 
                      suite601, suite602, suite603, suite604, suite605, suite606, suite607, suite608, suite609, suite610, suite611,
                      suite701, suite702, suite703, suite704, suite705, suite706, suite707, suite708, suite709, suite710, suite711,
                      suite801, suite802, suite803, suite804, suite805, suite806, suite807, suite808, suite809, suite810, suite811,
                      suite901, suite902, suite903, suite904, suite905, suite906, suite907, suite908, suite909, suite910, suite911,
                      suite1001, suite1002, suite1003, suite1004, suite1005, suite1006, suite1007, suite1008, suite1009, suite1010, suite1011,
                      suite1101, suite1102, suite1103, suite1104, suite1105, suite1106, suite1107, suite1108, suite1109, suite1110, suite1111, 
                      suite1301, suite1302, suite1303, suite1304, suite1305, suite1306, suite1307, suite1308, suite1309, suite1310, suite1311,
                      suite1401, suite1402, suite1403, suite1404, suite1405, suite1406, suite1407, suite1408, suite1409, suite1410, suite1411,
                      suite1501, suite1502, suite1503, suite1504, suite1505, suite1506, suite1507, suite1508, suite1509, suite1510, suite1511,
                      suite1601, suite1602, suite1603, suite1604, suite1605, suite1606, suite1607, suite1608, suite1609, suite1610, suite1611,
                      suite1701, suite1702, suite1703, suite1704, suite1705, suite1706, suite1707, suite1708, suite1709, suite1710, suite1711,
                      suite1801, suite1802, suite1803, suite1804, suite1805, suite1806, suite1807, suite1808, suite1809, suite1810, suite1811,
                      suite1901, suite1902, suite1903, suite1904, suite1905, suite1906, suite1907, suite1908, suite1909, suite1910, suite1911,
                      suite2001, suite2002, suite2003, suite2004, suite2005, suite2006, suite2007, suite2008, suite2009, suite2010, suite2011,
                      suite2101, suite2102, suite2103, suite2104, suite2105, suite2106, suite2107, suite2108, suite2109, suite2110, suite2111,
                      suite2201, suite2202, suite2203, suite2204, suite2205, suite2206, suite2207, suite2208, suite2209, suite2210, suite2211,
                      suite2301, suite2302, suite2303, suite2304, suite2305, suite2306, suite2307, suite2308, suite2309, suite2310, suite2311,
                      suite2401, suite2402, suite2403, suite2404, suite2405, suite2406, suite2407, suite2408, suite2409, suite2410, suite2411,
                      suite2501, suite2502, suite2503, suite2504, suite2505, suite2506, suite2507, suite2508, suite2509, suite2510, suite2511,
                      suite2601, suite2602, suite2603, suite2604, suite2605, suite2606, suite2607, suite2608, suite2609, suite2610, suite2611,
                      suite2701, suite2702, suite2703, suite2704, suite2705, suite2706, suite2707, suite2708, suite2709, suite2710, suite2711,
                      suite2801, suite2802, suite2803, suite2804, suite2805, suite2806, suite2807, suite2808, suite2809, suite2810, suite2811,
                      suite2901, suite2902, suite2903, suite2904, suite2905, suite2906, suite2907, suite2908, suite2909, suite2910, suite2911,
                      suite3001, suite3002, suite3003, suite3004, suite3005, suite3006, suite3007, suite3008, suite3009, suite3010, suite3011,
                      suite3101, suite3102, suite3103, suite3104, suite3105, suite3106, suite3107, suite3108, suite3109, suite3110, suite3111,
                      suite3201, suite3202, suite3203, suite3204, suite3205, suite3206, suite3207, suite3208, suite3209, suite3210, suite3211,
                      suite3301, suite3302, suite3303, suite3304, suite3305, suite3306, suite3307, suite3308, suite3309, suite3310, suite3311,
                      suite3401, suite3402, suite3403, suite3404, suite3405, suite3406, suite3407, suite3408, suite3409, suite3410, suite3411]

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
