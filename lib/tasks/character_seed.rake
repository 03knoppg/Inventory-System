namespace :app do
  desc <<-DESC
    Load testing data.
    Run using the command 'rake app:load_demo_data'
  DESC
  task :character_seed => [:environment] do

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


################################################################################################################
#Users                                                                                                         #
################################################################################################################

brett = User.create(username: "bh", email: "bh@bh.com", password: "bh")
graham = User.create(username: "gk", email: "gk@gk.com", password: "gk")


################################################################################################################
#Validations                                                                                                   #
################################################################################################################

jpg = Validation.create(extension: ".jpg", kind: "Image")
tga = Validation.create(extension: ".tga", kind: "Image")
png = Validation.create(extension: ".png", kind: "Image")
gif = Validation.create(extension: ".gif", kind: "Image")
dae = Validation.create(extension: ".DAE", kind: "Data File")
txt = Validation.create(extension: ".txt", kind: "Data File")
mat = Validation.create(extension: ".mat", kind: "Data File")
fbx = Validation.create(extension: ".fbx", kind: "Data File")
FBX2 = Validation.create(extension: ".FBX", kind: "Data File")
ab = Validation.create(extension: ".assetbundle", kind: "Data File")


################################################################################################################
#Categories                                                                                                    #
################################################################################################################

all = Category.create(name: "All")
characters = Category.create(name: "Characters", parent_id: all.id)


################################################################################################################
#Products                                                                                                      #
################################################################################################################

male = Product.create(name: "Male", description: "male", code: "male")
female = Product.create(name: "Female", description: "female", code: "female")


################################################################################################################
#Data_file                                                                                                     #
################################################################################################################


female_fbx = DataFile.create()
female_fbx.filedata = File.open("/unitydata/Female.FBX")
female_fbx.save!
female_idle1 = DataFile.create()
female_idle1.filedata = File.open("/unitydata/Female@idle1.FBX")
female_idle1.save!
female_item_boots = DataFile.create()
female_item_boots.filedata = File.open("/unitydata/Female@item_boots.fbx")
female_item_boots.save!
female_item_pants = DataFile.create()
female_item_pants.filedata = File.open("/unitydata/Female@item_pants.fbx")
female_item_pants.save!
female_item_shirt = DataFile.create()
female_item_shirt.filedata = File.open("/unitydata/Female@item_shirt.fbx")
female_item_shirt.save!
female_walk = DataFile.create()
female_walk.filedata = File.open("/unitydata/Female@walk.fbx")
female_walk.save!
female_walkin = DataFile.create()
female_walkin.filedata = File.open("/unitydata/Female@walkin.fbx")
female_walkin.save!


male_fbx = DataFile.create()
male_fbx.filedata = File.open("/unitydata/Male.FBX")
male_fbx.save!
male_idle1 = DataFile.create()
male_idle1.filedata = File.open("/unitydata/Male@idle1.fbx")
male_idle1.save!
male_item_boots = DataFile.create()
male_item_boots.filedata = File.open("/unitydata/Male@item_boots.fbx")
male_item_boots.save!
male_item_pants = DataFile.create()
male_item_pants.filedata = File.open("/unitydata/Male@item_pants.fbx")
male_item_pants.save!
male_item_shirt = DataFile.create()
male_item_shirt.filedata = File.open("/unitydata/Male@item_shirt.fbx")
male_item_shirt.save!
male_walk = DataFile.create()
male_walk.filedata = File.open("/unitydata/Male@walk.fbx")
male_walk.save!

male_pants_1_blue_mat = DataFile.create()
male_pants_1_blue_mat.filedata=File.open("/unitydata/male_pants-1_blue.mat")
male_pants_1_blue_mat.save!
male_pants_1_dark_mat = DataFile.create()
male_pants_1_dark_mat.filedata=File.open("/unitydata/male_pants-1_dark.mat")
male_pants_1_dark_mat.save!
male_pants_1_green_mat = DataFile.create()
male_pants_1_green_mat.filedata=File.open("/unitydata/male_pants-1_green.mat")
male_pants_1_green_mat.save!
male_pants_2_blue_mat = DataFile.create()
male_pants_2_blue_mat.filedata=File.open("/unitydata/male_pants-2_blue.mat")
male_pants_2_blue_mat.save!
male_pants_2_lillac_mat = DataFile.create()
male_pants_2_lillac_mat.filedata=File.open("/unitydata/male_pants-2_lillac.mat")
male_pants_2_lillac_mat.save!
male_pants_2_purple_mat = DataFile.create()
male_pants_2_purple_mat.filedata=File.open("/unitydata/male_pants-2_purple.mat")
male_pants_2_purple_mat.save!
female_pants_1_blue_mat = DataFile.create()
female_pants_1_blue_mat.filedata=File.open("/unitydata/female_pants-1_blue.mat")
female_pants_1_blue_mat.save!
female_pants_1_dark_mat = DataFile.create()
female_pants_1_dark_mat.filedata=File.open("/unitydata/female_pants-1_dark.mat")
female_pants_1_dark_mat.save!
female_pants_1_green_mat = DataFile.create()
female_pants_1_green_mat.filedata=File.open("/unitydata/female_pants-1_green.mat")
female_pants_1_green_mat.save!
female_pants_2_black_mat = DataFile.create()
female_pants_2_black_mat.filedata=File.open("/unitydata/female_pants-2_black.mat")
female_pants_2_black_mat.save!
female_pants_2_blue_mat = DataFile.create()
female_pants_2_blue_mat.filedata=File.open("/unitydata/female_pants-2_blue.mat")
female_pants_2_blue_mat.save!
female_pants_2_orange_mat = DataFile.create()
female_pants_2_orange_mat.filedata=File.open("/unitydata/female_pants-2_orange.mat")
female_pants_2_orange_mat.save!
male_face_1__mat = DataFile.create()
male_face_1__mat.filedata=File.open("/unitydata/male_face-1.mat")
male_face_1__mat.save!
male_face_2__mat = DataFile.create()
male_face_2__mat.filedata=File.open("/unitydata/male_face-2.mat")
male_face_2__mat.save!
female_face_1__mat = DataFile.create()
female_face_1__mat.filedata=File.open("/unitydata/female_face-1.mat")
female_face_1__mat.save!
female_face_2__mat = DataFile.create()
female_face_2__mat.filedata=File.open("/unitydata/female_face-2.mat")
female_face_2__mat.save!
male_hair_1_blond_mat = DataFile.create()
male_hair_1_blond_mat.filedata=File.open("/unitydata/male_hair-1_blond.mat")
male_hair_1_blond_mat.save!
male_hair_1_brown_mat = DataFile.create()
male_hair_1_brown_mat.filedata=File.open("/unitydata/male_hair-1_brown.mat")
male_hair_1_brown_mat.save!
male_hair_1_orange_mat = DataFile.create()
male_hair_1_orange_mat.filedata=File.open("/unitydata/male_hair-1_orange.mat")
male_hair_1_orange_mat.save!
male_hair_2_blond_mat = DataFile.create()
male_hair_2_blond_mat.filedata=File.open("/unitydata/male_hair-2_blond.mat")
male_hair_2_blond_mat.save!
male_hair_2_brown_mat = DataFile.create()
male_hair_2_brown_mat.filedata=File.open("/unitydata/male_hair-2_brown.mat")
male_hair_2_brown_mat.save!
male_hair_2_red_mat = DataFile.create()
male_hair_2_red_mat.filedata=File.open("/unitydata/male_hair-2_red.mat")
male_hair_2_red_mat.save!
female_hair_1_brown_mat = DataFile.create()
female_hair_1_brown_mat.filedata=File.open("/unitydata/female_hair-1_brown.mat")
female_hair_1_brown_mat.save!
female_hair_1_red_mat = DataFile.create()
female_hair_1_red_mat.filedata=File.open("/unitydata/female_hair-1_red.mat")
female_hair_1_red_mat.save!
female_hair_1_yellow_mat = DataFile.create()
female_hair_1_yellow_mat.filedata=File.open("/unitydata/female_hair-1_yellow.mat")
female_hair_1_yellow_mat.save!
female_hair_2_cyan_mat = DataFile.create()
female_hair_2_cyan_mat.filedata=File.open("/unitydata/female_hair-2_cyan.mat")
female_hair_2_cyan_mat.save!
female_hair_2_dark_mat = DataFile.create()
female_hair_2_dark_mat.filedata=File.open("/unitydata/female_hair-2_dark.mat")
female_hair_2_dark_mat.save!
female_hair_2_pink_mat = DataFile.create()
female_hair_2_pink_mat.filedata=File.open("/unitydata/female_hair-2_pink.mat")
female_hair_2_pink_mat.save!
male_shoes_1_black_mat = DataFile.create()
male_shoes_1_black_mat.filedata=File.open("/unitydata/male_shoes-1_black.mat")
male_shoes_1_black_mat.save!
male_shoes_1_green_mat = DataFile.create()
male_shoes_1_green_mat.filedata=File.open("/unitydata/male_shoes-1_green.mat")
male_shoes_1_green_mat.save!
male_shoes_1_red_mat = DataFile.create()
male_shoes_1_red_mat.filedata=File.open("/unitydata/male_shoes-1_red.mat")
male_shoes_1_red_mat.save!
male_shoes_2_brown_mat = DataFile.create()
male_shoes_2_brown_mat.filedata=File.open("/unitydata/male_shoes-2_brown.mat")
male_shoes_2_brown_mat.save!
male_shoes_2_dark_mat = DataFile.create()
male_shoes_2_dark_mat.filedata=File.open("/unitydata/male_shoes-2_dark.mat")
male_shoes_2_dark_mat.save!
male_shoes_2_red_mat = DataFile.create()
male_shoes_2_red_mat.filedata=File.open("/unitydata/male_shoes-2_red.mat")
male_shoes_2_red_mat.save!
female_shoes_1_blue_mat = DataFile.create()
female_shoes_1_blue_mat.filedata=File.open("/unitydata/female_shoes-1_blue.mat")
female_shoes_1_blue_mat.save!
female_shoes_1_green_mat = DataFile.create()
female_shoes_1_green_mat.filedata=File.open("/unitydata/female_shoes-1_green.mat")
female_shoes_1_green_mat.save!
female_shoes_1_yellow_mat = DataFile.create()
female_shoes_1_yellow_mat.filedata=File.open("/unitydata/female_shoes-1_yellow.mat")
female_shoes_1_yellow_mat.save!
female_shoes_2_blue_mat = DataFile.create()
female_shoes_2_blue_mat.filedata=File.open("/unitydata/female_shoes-2_blue.mat")
female_shoes_2_blue_mat.save!
female_shoes_2_red_mat = DataFile.create()
female_shoes_2_red_mat.filedata=File.open("/unitydata/female_shoes-2_red.mat")
female_shoes_2_red_mat.save!
female_shoes_2_yellow_mat = DataFile.create()
female_shoes_2_yellow_mat.filedata=File.open("/unitydata/female_shoes-2_yellow.mat")
female_shoes_2_yellow_mat.save!
male_top_1_blue_mat = DataFile.create()
male_top_1_blue_mat.filedata=File.open("/unitydata/male_top-1_blue.mat")
male_top_1_blue_mat.save!
male_top_1_pink_mat = DataFile.create()
male_top_1_pink_mat.filedata=File.open("/unitydata/male_top-1_pink.mat")
male_top_1_pink_mat.save!
male_top_1_yellow_mat = DataFile.create()
male_top_1_yellow_mat.filedata=File.open("/unitydata/male_top-1_yellow.mat")
male_top_1_yellow_mat.save!
male_top_2_gray_mat = DataFile.create()
male_top_2_gray_mat.filedata=File.open("/unitydata/male_top-2_gray.mat")
male_top_2_gray_mat.save!
male_top_2_green_mat = DataFile.create()
male_top_2_green_mat.filedata=File.open("/unitydata/male_top-2_green.mat")
male_top_2_green_mat.save!
male_top_2_orange_mat = DataFile.create()
male_top_2_orange_mat.filedata=File.open("/unitydata/male_top-2_orange.mat")
male_top_2_orange_mat.save!
female_top_1_blue_mat = DataFile.create()
female_top_1_blue_mat.filedata=File.open("/unitydata/female_top-1_blue.mat")
female_top_1_blue_mat.save!
female_top_1_green_mat = DataFile.create()
female_top_1_green_mat.filedata=File.open("/unitydata/female_top-1_green.mat")
female_top_1_green_mat.save!
female_top_1_pink_mat = DataFile.create()
female_top_1_pink_mat.filedata=File.open("/unitydata/female_top-1_pink.mat")
female_top_1_pink_mat.save!
female_top_2_green_mat = DataFile.create()
female_top_2_green_mat.filedata=File.open("/unitydata/female_top-2_green.mat")
female_top_2_green_mat.save!
female_top_2_orange_mat = DataFile.create()
female_top_2_orange_mat.filedata=File.open("/unitydata/female_top-2_orange.mat")
female_top_2_orange_mat.save!
female_top_2_purple_mat = DataFile.create()
female_top_2_purple_mat.filedata=File.open("/unitydata/female_top-2_purple.mat")
female_top_2_purple_mat.save!
male_eyes_blue_mat = DataFile.create()
male_eyes_blue_mat.filedata=File.open("/unitydata/male_eyes_blue.mat")
male_eyes_blue_mat.save!
male_eyes_brown_mat = DataFile.create()
male_eyes_brown_mat.filedata=File.open("/unitydata/male_eyes_brown.mat")
male_eyes_brown_mat.save!
male_eyes_green_mat = DataFile.create()
male_eyes_green_mat.filedata=File.open("/unitydata/male_eyes_green.mat")
male_eyes_green_mat.save!
female_eyes_blue_mat = DataFile.create()
female_eyes_blue_mat.filedata=File.open("/unitydata/female_eyes_blue.mat")
female_eyes_blue_mat.save!
female_eyes_brown_mat = DataFile.create()
female_eyes_brown_mat.filedata=File.open("/unitydata/female_eyes_brown.mat")
female_eyes_brown_mat.save!
female_eyes_green_mat = DataFile.create()
female_eyes_green_mat.filedata=File.open("/unitydata/female_eyes_green.mat")
female_eyes_green_mat.save!
    
    
male_pants_1_assetbundle =DataFile.create()
male_pants_1_assetbundle.filedata=File.open("/unitydata/male_pants-1.assetbundle")
male_pants_1_assetbundle.save!
male_pants_2_assetbundle =DataFile.create()
male_pants_2_assetbundle.filedata=File.open("/unitydata/male_pants-2.assetbundle")
male_pants_2_assetbundle.save!
female_pants_1_assetbundle =DataFile.create()
female_pants_1_assetbundle.filedata=File.open("/unitydata/female_pants-1.assetbundle")
female_pants_1_assetbundle.save!
female_pants_2_assetbundle =DataFile.create()
female_pants_2_assetbundle.filedata=File.open("/unitydata/female_pants-2.assetbundle")
female_pants_2_assetbundle.save!
male_face_1_assetbundle =DataFile.create()
male_face_1_assetbundle.filedata=File.open("/unitydata/male_face-1.assetbundle")
male_face_1_assetbundle.save!
male_face_2_assetbundle =DataFile.create()
male_face_2_assetbundle.filedata=File.open("/unitydata/male_face-2.assetbundle")
male_face_2_assetbundle.save!
female_face_1_assetbundle =DataFile.create()
female_face_1_assetbundle.filedata=File.open("/unitydata/female_face-1.assetbundle")
female_face_1_assetbundle.save!
female_face_2_assetbundle =DataFile.create()
female_face_2_assetbundle.filedata=File.open("/unitydata/female_face-2.assetbundle")
female_face_2_assetbundle.save!
male_hair_1_assetbundle =DataFile.create()
male_hair_1_assetbundle.filedata=File.open("/unitydata/male_hair-1.assetbundle")
male_hair_1_assetbundle.save!
male_hair_2_assetbundle =DataFile.create()
male_hair_2_assetbundle.filedata=File.open("/unitydata/male_hair-2.assetbundle")
male_hair_2_assetbundle.save!
female_hair_1_assetbundle =DataFile.create()
female_hair_1_assetbundle.filedata=File.open("/unitydata/female_hair-1.assetbundle")
female_hair_1_assetbundle.save!
female_hair_2_assetbundle =DataFile.create()
female_hair_2_assetbundle.filedata=File.open("/unitydata/female_hair-2.assetbundle")
female_hair_2_assetbundle.save!
male_shoes_1_assetbundle =DataFile.create()
male_shoes_1_assetbundle.filedata=File.open("/unitydata/male_shoes-1.assetbundle")
male_shoes_1_assetbundle.save!
male_shoes_2_assetbundle =DataFile.create()
male_shoes_2_assetbundle.filedata=File.open("/unitydata/male_shoes-2.assetbundle")
male_shoes_2_assetbundle.save!
female_shoes_1_assetbundle =DataFile.create()
female_shoes_1_assetbundle.filedata=File.open("/unitydata/female_shoes-1.assetbundle")
female_shoes_1_assetbundle.save!
female_shoes_2_assetbundle =DataFile.create()
female_shoes_2_assetbundle.filedata=File.open("/unitydata/female_shoes-2.assetbundle")
female_shoes_2_assetbundle.save!
male_top_1_assetbundle =DataFile.create()
male_top_1_assetbundle.filedata=File.open("/unitydata/male_top-1.assetbundle")
male_top_1_assetbundle.save!
male_top_2_assetbundle =DataFile.create()
male_top_2_assetbundle.filedata=File.open("/unitydata/male_top-2.assetbundle")
male_top_2_assetbundle.save!
female_top_1_assetbundle =DataFile.create()
female_top_1_assetbundle.filedata=File.open("/unitydata/female_top-1.assetbundle")
female_top_1_assetbundle.save!
female_top_2_assetbundle =DataFile.create()
female_top_2_assetbundle.filedata=File.open("/unitydata/female_top-2.assetbundle")
female_top_2_assetbundle.save!
male_eyes_assetbundle =DataFile.create()
male_eyes_assetbundle.filedata=File.open("/unitydata/male_eyes.assetbundle")
male_eyes_assetbundle.save!
female_eyes_assetbundle =DataFile.create()
female_eyes_assetbundle.filedata=File.open("/unitydata/female_eyes.assetbundle")
female_eyes_assetbundle.save!


characterElementDatabase = DataFile.create()
characterElementDatabase.filedata= File.open("/unitydata/CharacterElementDatabase.assetbundle")
characterElementDatabase.save!
female_characterbase = DataFile.create()
female_characterbase.filedata= File.open("/unitydata/female_characterbase.assetbundle")
female_characterbase.save!
male_characterbase = DataFile.create()
male_characterbase.filedata= File.open("/unitydata/male_characterbase.assetbundle")
male_characterbase.save!
 



################################################################################################################
#Groups                                                                                                        #
################################################################################################################

#Groups below represent an "or" choice
male_pants      = Group.create(name: "male_pants")
female_pants    = Group.create(name: "female_pants")
male_face       = Group.create(name: "male_face")
female_face     = Group.create(name: "female_face")
male_hair       = Group.create(name: "male_hair")
female_hair     = Group.create(name: "female_hair")
male_shoes      = Group.create(name: "male_shoes")
female_shoes    = Group.create(name: "female_shoes")
male_top        = Group.create(name: "male_top")
female_top      = Group.create(name: "female_top")



################################################################################################################
#Components                                                                                                    #
################################################################################################################

#Component Group - Arm

male_pants_1      = Component.create(name: "male_pants_1", description: "", code: "pants", group_id: male_pants.id)
male_pants_2      = Component.create(name: "male_pants_2", description: "", code: "pants", group_id: male_pants.id)
female_pants_1    = Component.create(name: "female_pants_1", description: "", code: "pants", group_id: female_pants.id)
female_pants_2    = Component.create(name: "female_pants_2", description: "", code: "pants", group_id: female_pants.id)
male_face_1       = Component.create(name: "male_face_1", description: "", code: "face", group_id: male_face.id)
male_face_2       = Component.create(name: "male_face_2", description: "", code: "face", group_id: male_face.id)
female_face_1     = Component.create(name: "female_face_1", description: "", code: "face", group_id: female_face.id)
female_face_2     = Component.create(name: "female_face_2", description: "", code: "face", group_id: female_face.id)
male_hair_1       = Component.create(name: "male_hair_1", description: "", code: "hair", group_id: male_hair.id)
male_hair_2       = Component.create(name: "male_hair_2", description: "", code: "hair", group_id: male_hair.id)
female_hair_1     = Component.create(name: "female_hair_1", description: "", code: "hair", group_id: female_hair.id)
female_hair_2     = Component.create(name: "female_hair_2", description: "", code: "hair", group_id: female_hair.id)
male_shoes_1      = Component.create(name: "male_shoes_1", description: "", code: "shoes", group_id: male_shoes.id)
male_shoes_2      = Component.create(name: "male_shoes_2", description: "", code: "shoes", group_id: male_shoes.id)
female_shoes_1    = Component.create(name: "female_shoes_1", description: "", code: "shoes", group_id: female_shoes.id)
female_shoes_2    = Component.create(name: "female_shoes_2", description: "", code: "shoes", group_id: female_shoes.id)
male_top_1        = Component.create(name: "male_top_1", description: "", code: "top", group_id: male_top.id)
male_top_2        = Component.create(name: "male_top_2", description: "", code: "top", group_id: male_top.id)
female_top_1      = Component.create(name: "female_top_1", description: "", code: "top", group_id: female_top.id)
female_top_2      = Component.create(name: "female_top_2", description: "", code: "top", group_id: female_top.id)
male_eyes         = Component.create(name: "male_eyes", description: "", code: "eyes")
female_eyes       = Component.create(name: "female_eyes", description: "", code: "eyes")


################################################################################################################
#Properties                                                                                                    #
################################################################################################################


male_pants_colour      = Property.create(name: "male_pants", description: "property", field_type: "string")
female_pants_colour    = Property.create(name: "female_pants", description: "property", field_type: "string")
male_face_colour       = Property.create(name: "male_face", description: "property", field_type: "string")
female_face_colour     = Property.create(name: "female_face", description: "property", field_type: "string")
male_hair_colour       = Property.create(name: "male_hair", description: "property", field_type: "string")
female_hair_colour     = Property.create(name: "female_hair", description: "property", field_type: "string")
male_shoes_colour      = Property.create(name: "male_shoes", description: "property", field_type: "string")
female_shoes_colour    = Property.create(name: "female_shoes", description: "property", field_type: "string")
male_top_colour        = Property.create(name: "male_top", description: "property", field_type: "string")
female_top_colour      = Property.create(name: "female_top", description: "property", field_type: "string")
male_eyes_colour        = Property.create(name: "male_eye", description: "property", field_type: "string")
female_eyes_colour      = Property.create(name: "female_eye", description: "property", field_type: "string")


################################################################################################################
#ValueFields                                                                                                   #
################################################################################################################



male_pants_1_blue      = Valuefield.create(fieldvalue: "male_pants_1_blue", code: "blue", property_id: male_pants_colour.id)
male_pants_1_dark      = Valuefield.create(fieldvalue: "male_pants_1_dark", code: "dark", property_id: male_pants_colour.id)
male_pants_1_green      = Valuefield.create(fieldvalue: "male_pants_1_green", code: "green", property_id: male_pants_colour.id)
male_pants_1_normal      = Valuefield.create(fieldvalue: "male_pants_1_normal", code: "normal", property_id: male_pants_colour.id)
male_pants_2_blue      = Valuefield.create(fieldvalue: "male_pants_2_blue", code: "blue", property_id: male_pants_colour.id)
male_pants_2_lillac      = Valuefield.create(fieldvalue: "male_pants_2_lillac", code: "lillac", property_id: male_pants_colour.id)
male_pants_2_normal      = Valuefield.create(fieldvalue: "male_pants_2_normal", code: "normal", property_id: male_pants_colour.id)
male_pants_2_purple      = Valuefield.create(fieldvalue: "male_pants_2_purple", code: "purple", property_id: male_pants_colour.id)
female_pants_1_blue    = Valuefield.create(fieldvalue: "female_pants_1_blue", code: "blue", property_id: female_pants_colour.id)
female_pants_1_dark    = Valuefield.create(fieldvalue: "female_pants_1_dark", code: "dark", property_id: female_pants_colour.id)
female_pants_1_green    = Valuefield.create(fieldvalue: "female_pants_1_green", code: "green", property_id: female_pants_colour.id)
female_pants_1_normal    = Valuefield.create(fieldvalue: "female_pants_1_normal", code: "normal", property_id: female_pants_colour.id)
female_pants_2_black    = Valuefield.create(fieldvalue: "female_pants_2_black", code: "black", property_id: female_pants_colour.id)
female_pants_2_blue    = Valuefield.create(fieldvalue: "female_pants_2_blue", code: "blue", property_id: female_pants_colour.id)
female_pants_2_normal    = Valuefield.create(fieldvalue: "female_pants_2_normal", code: "normal", property_id: female_pants_colour.id)
female_pants_2_orange    = Valuefield.create(fieldvalue: "female_pants_2_orange", code: "orange", property_id: female_pants_colour.id)
male_face_1_            = Valuefield.create(fieldvalue: "male_face_1_", code: "", property_id: male_face_colour.id)
male_face_1_normal       = Valuefield.create(fieldvalue: "male_face_1_normal", code: "normal", property_id: male_face_colour.id)
male_face_2_            = Valuefield.create(fieldvalue: "male_face_2_", code: "", property_id: male_face_colour.id)
male_face_2_normal       = Valuefield.create(fieldvalue: "male_face_2_normal", code: "normal", property_id: male_face_colour.id)
female_face_1_            = Valuefield.create(fieldvalue: "female_face_1_", code: "", property_id: female_face_colour.id)
female_face_1_normal     = Valuefield.create(fieldvalue: "female_face_1_normal", code: "normal", property_id: female_face_colour.id)
female_face_2_           = Valuefield.create(fieldvalue: "female_face_2_", code: "", property_id: female_face_colour.id)
female_face_2_normal     = Valuefield.create(fieldvalue: "female_face_2_normal", code: "normal", property_id: female_face_colour.id)
male_hair_1_blond       = Valuefield.create(fieldvalue: "male_hair_1_blond", code: "blond", property_id: male_hair_colour.id)
male_hair_1_brown       = Valuefield.create(fieldvalue: "male_hair_1_brown", code: "brown", property_id: male_hair_colour.id)
male_hair_1_normal       = Valuefield.create(fieldvalue: "male_hair_1_normal", code: "normal", property_id: male_hair_colour.id)
male_hair_1_orange       = Valuefield.create(fieldvalue: "male_hair_1_orange", code: "orange", property_id: male_hair_colour.id)
male_hair_2_blond       = Valuefield.create(fieldvalue: "male_hair_2_blond", code: "blond", property_id: male_hair_colour.id)
male_hair_2_brown       = Valuefield.create(fieldvalue: "male_hair_2_brown", code: "brown", property_id: male_hair_colour.id)
male_hair_2_normal       = Valuefield.create(fieldvalue: "male_hair_2_normal", code: "normal", property_id: male_hair_colour.id)
male_hair_2_red       = Valuefield.create(fieldvalue: "male_hair_2_red", code: "red", property_id: male_hair_colour.id)
female_hair_1_brown     = Valuefield.create(fieldvalue: "female_hair_1_brown", code: "brown", property_id: female_hair_colour.id)
female_hair_1_normal     = Valuefield.create(fieldvalue: "female_hair_1_normal", code: "normal", property_id: female_hair_colour.id)
female_hair_1_red     = Valuefield.create(fieldvalue: "female_hair_1_red", code: "red", property_id: female_hair_colour.id)
female_hair_1_yellow     = Valuefield.create(fieldvalue: "female_hair_1_yellow", code: "yellow", property_id: female_hair_colour.id)
female_hair_2_cyan     = Valuefield.create(fieldvalue: "female_hair_2_cyan", code: "cyan", property_id: female_hair_colour.id)
female_hair_2_dark     = Valuefield.create(fieldvalue: "female_hair_2_dark", code: "dark", property_id: female_hair_colour.id)
female_hair_2_pink     = Valuefield.create(fieldvalue: "female_hair_2_pink", code: "pink", property_id: female_hair_colour.id)
male_shoes_1_black      = Valuefield.create(fieldvalue: "male_shoes_1_black", code: "black", property_id: male_shoes_colour.id)
male_shoes_1_green      = Valuefield.create(fieldvalue: "male_shoes_1_green", code: "green", property_id: male_shoes_colour.id)
male_shoes_1_normal      = Valuefield.create(fieldvalue: "male_shoes_1_normal", code: "normal", property_id: male_shoes_colour.id)
male_shoes_1_red      = Valuefield.create(fieldvalue: "male_shoes_1_red", code: "red", property_id: male_shoes_colour.id)
male_shoes_2_brown      = Valuefield.create(fieldvalue: "male_shoes_2_brown", code: "brown", property_id: male_shoes_colour.id)
male_shoes_2_dark      = Valuefield.create(fieldvalue: "male_shoes_2_dark", code: "dark", property_id: male_shoes_colour.id)
male_shoes_2_normal      = Valuefield.create(fieldvalue: "male_shoes_2_normal", code: "normal", property_id: male_shoes_colour.id)
male_shoes_2_red      = Valuefield.create(fieldvalue: "male_shoes_2_red", code: "red", property_id: male_shoes_colour.id)
female_shoes_1_blue    = Valuefield.create(fieldvalue: "female_shoes_1_blue", code: "blue", property_id: female_shoes_colour.id)
female_shoes_1_green    = Valuefield.create(fieldvalue: "female_shoes_1_green", code: "green", property_id: female_shoes_colour.id)
female_shoes_1_normal    = Valuefield.create(fieldvalue: "female_shoes_1_normal", code: "normal", property_id: female_shoes_colour.id)
female_shoes_1_yellow    = Valuefield.create(fieldvalue: "female_shoes_1_yellow", code: "yellow", property_id: female_shoes_colour.id)
female_shoes_2_blue    = Valuefield.create(fieldvalue: "female_shoes_2_blue", code: "blue", property_id: female_shoes_colour.id)
female_shoes_2_normal    = Valuefield.create(fieldvalue: "female_shoes_2_normal", code: "normal", property_id: female_shoes_colour.id)
female_shoes_2_red    = Valuefield.create(fieldvalue: "female_shoes_2_red", code: "red", property_id: female_shoes_colour.id)
female_shoes_2_yellow    = Valuefield.create(fieldvalue: "female_shoes_2_yellow", code: "yellow", property_id: female_shoes_colour.id)
male_top_1_blue        = Valuefield.create(fieldvalue: "male_top_1_blue", code: "blue", property_id: male_top_colour.id)
male_top_1_normal        = Valuefield.create(fieldvalue: "male_top_1_normal", code: "normal", property_id: male_top_colour.id)
male_top_1_pink        = Valuefield.create(fieldvalue: "male_top_1_pink", code: "pink", property_id: male_top_colour.id)
male_top_1_yellow        = Valuefield.create(fieldvalue: "male_top_1_yellow", code: "yellow", property_id: male_top_colour.id)
male_top_2_gray        = Valuefield.create(fieldvalue: "male_top_2_gray", code: "gray", property_id: male_top_colour.id)
male_top_2_green        = Valuefield.create(fieldvalue: "male_top_2_green", code: "green", property_id: male_top_colour.id)
male_top_2_normal        = Valuefield.create(fieldvalue: "male_top_2_normal", code: "normal", property_id: male_top_colour.id)
male_top_2_orange        = Valuefield.create(fieldvalue: "male_top_2_orange", code: "orange", property_id: male_top_colour.id)
female_top_1_blue      = Valuefield.create(fieldvalue: "female_top_1_blue", code: "blue", property_id: female_top_colour.id)
female_top_1_green      = Valuefield.create(fieldvalue: "female_top_1_green", code: "green", property_id: female_top_colour.id)
female_top_1_normal      = Valuefield.create(fieldvalue: "female_top_1_normal", code: "normal", property_id: female_top_colour.id)
female_top_1_pink      = Valuefield.create(fieldvalue: "female_top_1_pink", code: "pink", property_id: female_top_colour.id)
female_top_2_green      = Valuefield.create(fieldvalue: "female_top_2_green", code: "green", property_id: female_top_colour.id)
female_top_2_normal      = Valuefield.create(fieldvalue: "female_top_2_normal", code: "normal", property_id: female_top_colour.id)
female_top_2_orange      = Valuefield.create(fieldvalue: "female_top_2_orange", code: "orange", property_id: female_top_colour.id)
female_top_2_purple      = Valuefield.create(fieldvalue: "female_top_2_purple", code: "purple", property_id: female_top_colour.id)
male_eyes_blue         = Valuefield.create(fieldvalue: "male_eyes_blue", code: "blue", property_id: male_eyes_colour.id)
male_eyes_brown         = Valuefield.create(fieldvalue: "male_eyes_brown", code: "brown", property_id: male_eyes_colour.id)
male_eyes_green         = Valuefield.create(fieldvalue: "male_eyes_green", code: "green", property_id: male_eyes_colour.id)
female_eyes_blue       = Valuefield.create(fieldvalue: "female_eyes_blue", code: "blue", property_id: female_eyes_colour.id)
female_eyes_brown       = Valuefield.create(fieldvalue: "female_eyes_brown", code: "brown", property_id: female_eyes_colour.id)
female_eyes_green       = Valuefield.create(fieldvalue: "female_eyes_green", code: "green", property_id: female_eyes_colour.id)


################################################################################################################
#Images                                                                                                        #
################################################################################################################


male_pants_1_blue_tga = Image.create()
male_pants_1_blue_tga.picture= File.open("/unitydata/male_pants-1_blue.tga")
male_pants_1_blue_tga.save!
male_pants_1_dark_tga = Image.create()
male_pants_1_dark_tga.picture= File.open("/unitydata/male_pants-1_dark.tga")
male_pants_1_dark_tga.save!
male_pants_1_green_tga = Image.create()
male_pants_1_green_tga.picture= File.open("/unitydata/male_pants-1_green.tga")
male_pants_1_green_tga.save!
male_pants_1_normal_tga = Image.create()
male_pants_1_normal_tga.picture= File.open("/unitydata/male_pants-1_normal.tga")
male_pants_1_normal_tga.save!
male_pants_2_blue_tga = Image.create()
male_pants_2_blue_tga.picture= File.open("/unitydata/male_pants-2_blue.tga")
male_pants_2_blue_tga.save!
male_pants_2_lillac_tga = Image.create()
male_pants_2_lillac_tga.picture= File.open("/unitydata/male_pants-2_lillac.tga")
male_pants_2_lillac_tga.save!
male_pants_2_normal_tga = Image.create()
male_pants_2_normal_tga.picture= File.open("/unitydata/male_pants-2_normal.tga")
male_pants_2_normal_tga.save!
male_pants_2_purple_tga = Image.create()
male_pants_2_purple_tga.picture= File.open("/unitydata/male_pants-2_purple.tga")
male_pants_2_purple_tga.save!
female_pants_1_blue_tga = Image.create()
female_pants_1_blue_tga.picture= File.open("/unitydata/female_pants-1_blue.tga")
female_pants_1_blue_tga.save!
female_pants_1_dark_tga = Image.create()
female_pants_1_dark_tga.picture= File.open("/unitydata/female_pants-1_dark.tga")
female_pants_1_dark_tga.save!
female_pants_1_green_tga = Image.create()
female_pants_1_green_tga.picture= File.open("/unitydata/female_pants-1_green.tga")
female_pants_1_green_tga.save!
female_pants_1_normal_tga = Image.create()
female_pants_1_normal_tga.picture= File.open("/unitydata/female_pants-1_normal.tga")
female_pants_1_normal_tga.save!
female_pants_2_black_tga = Image.create()
female_pants_2_black_tga.picture= File.open("/unitydata/female_pants-2_black.tga")
female_pants_2_black_tga.save!
female_pants_2_blue_tga = Image.create()
female_pants_2_blue_tga.picture= File.open("/unitydata/female_pants-2_blue.tga")
female_pants_2_blue_tga.save!
female_pants_2_normal_tga = Image.create()
female_pants_2_normal_tga.picture= File.open("/unitydata/female_pants-2_normal.tga")
female_pants_2_normal_tga.save!
female_pants_2_orange_tga = Image.create()
female_pants_2_orange_tga.picture= File.open("/unitydata/female_pants-2_orange.tga")
female_pants_2_orange_tga.save!
male_face_1__tga = Image.create()
male_face_1__tga.picture= File.open("/unitydata/male_face-1.tga")
male_face_1__tga.save!
male_face_1_normal_tga = Image.create()
male_face_1_normal_tga.picture= File.open("/unitydata/male_face-1_normal.tga")
male_face_1_normal_tga.save!
male_face_2__tga = Image.create()
male_face_2__tga.picture= File.open("/unitydata/male_face-2.tga")
male_face_2__tga.save!
male_face_2_normal_tga = Image.create()
male_face_2_normal_tga.picture= File.open("/unitydata/male_face-2_normal.tga")
male_face_2_normal_tga.save!
female_face_1__tga = Image.create()
female_face_1__tga.picture= File.open("/unitydata/female_face-1.tga")
female_face_1__tga.save!
female_face_1_normal_tga = Image.create()
female_face_1_normal_tga.picture= File.open("/unitydata/female_face-1_normal.tga")
female_face_1_normal_tga.save!
female_face_2__tga = Image.create()
female_face_2__tga.picture= File.open("/unitydata/female_face-2.tga")
female_face_2__tga.save!
female_face_2_normal_tga = Image.create()
female_face_2_normal_tga.picture= File.open("/unitydata/female_face-2_normal.tga")
female_face_2_normal_tga.save!
male_hair_1_blond_tga = Image.create()
male_hair_1_blond_tga.picture= File.open("/unitydata/male_hair-1_blond.tga")
male_hair_1_blond_tga.save!
male_hair_1_brown_tga = Image.create()
male_hair_1_brown_tga.picture= File.open("/unitydata/male_hair-1_brown.tga")
male_hair_1_brown_tga.save!
male_hair_1_normal_tga = Image.create()
male_hair_1_normal_tga.picture= File.open("/unitydata/male_hair-1_normal.tga")
male_hair_1_normal_tga.save!
male_hair_1_orange_tga = Image.create()
male_hair_1_orange_tga.picture= File.open("/unitydata/male_hair-1_orange.tga")
male_hair_1_orange_tga.save!
male_hair_2_blond_tga = Image.create()
male_hair_2_blond_tga.picture= File.open("/unitydata/male_hair-2_blond.tga")
male_hair_2_blond_tga.save!
male_hair_2_brown_tga = Image.create()
male_hair_2_brown_tga.picture= File.open("/unitydata/male_hair-2_brown.tga")
male_hair_2_brown_tga.save!
male_hair_2_normal_tga = Image.create()
male_hair_2_normal_tga.picture= File.open("/unitydata/male_hair-2_normal.tga")
male_hair_2_normal_tga.save!
male_hair_2_red_tga = Image.create()
male_hair_2_red_tga.picture= File.open("/unitydata/male_hair-2_red.tga")
male_hair_2_red_tga.save!
female_hair_1_brown_tga = Image.create()
female_hair_1_brown_tga.picture= File.open("/unitydata/female_hair-1_brown.tga")
female_hair_1_brown_tga.save!
female_hair_1_normal_tga = Image.create()
female_hair_1_normal_tga.picture= File.open("/unitydata/female_hair-1_normal.tga")
female_hair_1_normal_tga.save!
female_hair_1_red_tga = Image.create()
female_hair_1_red_tga.picture= File.open("/unitydata/female_hair-1_red.tga")
female_hair_1_red_tga.save!
female_hair_1_yellow_tga = Image.create()
female_hair_1_yellow_tga.picture= File.open("/unitydata/female_hair-1_yellow.tga")
female_hair_1_yellow_tga.save!
female_hair_2_cyan_tga = Image.create()
female_hair_2_cyan_tga.picture= File.open("/unitydata/female_hair-2_cyan.tga")
female_hair_2_cyan_tga.save!
female_hair_2_dark_tga = Image.create()
female_hair_2_dark_tga.picture= File.open("/unitydata/female_hair-2_dark.tga")
female_hair_2_dark_tga.save!
female_hair_2_pink_tga = Image.create()
female_hair_2_pink_tga.picture= File.open("/unitydata/female_hair-2_pink.tga")
female_hair_2_pink_tga.save!
male_shoes_1_black_tga = Image.create()
male_shoes_1_black_tga.picture= File.open("/unitydata/male_shoes-1_black.tga")
male_shoes_1_black_tga.save!
male_shoes_1_green_tga = Image.create()
male_shoes_1_green_tga.picture= File.open("/unitydata/male_shoes-1_green.tga")
male_shoes_1_green_tga.save!
male_shoes_1_normal_tga = Image.create()
male_shoes_1_normal_tga.picture= File.open("/unitydata/male_shoes-1_normal.tga")
male_shoes_1_normal_tga.save!
male_shoes_1_red_tga = Image.create()
male_shoes_1_red_tga.picture= File.open("/unitydata/male_shoes-1_red.tga")
male_shoes_1_red_tga.save!
male_shoes_2_brown_tga = Image.create()
male_shoes_2_brown_tga.picture= File.open("/unitydata/male_shoes-2_brown.tga")
male_shoes_2_brown_tga.save!
male_shoes_2_dark_tga = Image.create()
male_shoes_2_dark_tga.picture= File.open("/unitydata/male_shoes-2_dark.tga")
male_shoes_2_dark_tga.save!
male_shoes_2_normal_tga = Image.create()
male_shoes_2_normal_tga.picture= File.open("/unitydata/male_shoes-2_normal.tga")
male_shoes_2_normal_tga.save!
male_shoes_2_red_tga = Image.create()
male_shoes_2_red_tga.picture= File.open("/unitydata/male_shoes-2_red.tga")
male_shoes_2_red_tga.save!
female_shoes_1_blue_tga = Image.create()
female_shoes_1_blue_tga.picture= File.open("/unitydata/female_shoes-1_blue.tga")
female_shoes_1_blue_tga.save!
female_shoes_1_green_tga = Image.create()
female_shoes_1_green_tga.picture= File.open("/unitydata/female_shoes-1_green.tga")
female_shoes_1_green_tga.save!
female_shoes_1_normal_tga = Image.create()
female_shoes_1_normal_tga.picture= File.open("/unitydata/female_shoes-1_normal.tga")
female_shoes_1_normal_tga.save!
female_shoes_1_yellow_tga = Image.create()
female_shoes_1_yellow_tga.picture= File.open("/unitydata/female_shoes-1_yellow.tga")
female_shoes_1_yellow_tga.save!
female_shoes_2_blue_tga = Image.create()
female_shoes_2_blue_tga.picture= File.open("/unitydata/female_shoes-2_blue.tga")
female_shoes_2_blue_tga.save!
female_shoes_2_normal_tga = Image.create()
female_shoes_2_normal_tga.picture= File.open("/unitydata/female_shoes-2_normal.tga")
female_shoes_2_normal_tga.save!
female_shoes_2_red_tga = Image.create()
female_shoes_2_red_tga.picture= File.open("/unitydata/female_shoes-2_red.tga")
female_shoes_2_red_tga.save!
female_shoes_2_yellow_tga = Image.create()
female_shoes_2_yellow_tga.picture= File.open("/unitydata/female_shoes-2_yellow.tga")
female_shoes_2_yellow_tga.save!
male_top_1_blue_tga = Image.create()
male_top_1_blue_tga.picture= File.open("/unitydata/male_top-1_blue.tga")
male_top_1_blue_tga.save!
male_top_1_normal_tga = Image.create()
male_top_1_normal_tga.picture= File.open("/unitydata/male_top-1_normal.tga")
male_top_1_normal_tga.save!
male_top_1_pink_tga = Image.create()
male_top_1_pink_tga.picture= File.open("/unitydata/male_top-1_pink.tga")
male_top_1_pink_tga.save!
male_top_1_yellow_tga = Image.create()
male_top_1_yellow_tga.picture= File.open("/unitydata/male_top-1_yellow.tga")
male_top_1_yellow_tga.save!
male_top_2_gray_tga = Image.create()
male_top_2_gray_tga.picture= File.open("/unitydata/male_top-2_gray.tga")
male_top_2_gray_tga.save!
male_top_2_green_tga = Image.create()
male_top_2_green_tga.picture= File.open("/unitydata/male_top-2_green.tga")
male_top_2_green_tga.save!
male_top_2_normal_tga = Image.create()
male_top_2_normal_tga.picture= File.open("/unitydata/male_top-2_normal.tga")
male_top_2_normal_tga.save!
male_top_2_orange_tga = Image.create()
male_top_2_orange_tga.picture= File.open("/unitydata/male_top-2_orange.tga")
male_top_2_orange_tga.save!
female_top_1_blue_tga = Image.create()
female_top_1_blue_tga.picture= File.open("/unitydata/female_top-1_blue.tga")
female_top_1_blue_tga.save!
female_top_1_green_tga = Image.create()
female_top_1_green_tga.picture= File.open("/unitydata/female_top-1_green.tga")
female_top_1_green_tga.save!
female_top_1_normal_tga = Image.create()
female_top_1_normal_tga.picture= File.open("/unitydata/female_top-1_normal.tga")
female_top_1_normal_tga.save!
female_top_1_pink_tga = Image.create()
female_top_1_pink_tga.picture= File.open("/unitydata/female_top-1_pink.tga")
female_top_1_pink_tga.save!
female_top_2_green_tga = Image.create()
female_top_2_green_tga.picture= File.open("/unitydata/female_top-2_green.tga")
female_top_2_green_tga.save!
female_top_2_normal_tga = Image.create()
female_top_2_normal_tga.picture= File.open("/unitydata/female_top-2_normal.tga")
female_top_2_normal_tga.save!
female_top_2_orange_tga = Image.create()
female_top_2_orange_tga.picture= File.open("/unitydata/female_top-2_orange.tga")
female_top_2_orange_tga.save!
female_top_2_purple_tga = Image.create()
female_top_2_purple_tga.picture= File.open("/unitydata/female_top-2_purple.tga")
female_top_2_purple_tga.save!
male_eyes_blue_tga = Image.create()
male_eyes_blue_tga.picture= File.open("/unitydata/male_eyes_blue.tga")
male_eyes_blue_tga.save!
male_eyes_brown_tga = Image.create()
male_eyes_brown_tga.picture= File.open("/unitydata/male_eyes_brown.tga")
male_eyes_brown_tga.save!
male_eyes_green_tga = Image.create()
male_eyes_green_tga.picture= File.open("/unitydata/male_eyes_green.tga")
male_eyes_green_tga.save!
female_eyes_blue_tga = Image.create()
female_eyes_blue_tga.picture= File.open("/unitydata/female_eyes_blue.tga")
female_eyes_blue_tga.save!
female_eyes_brown_tga = Image.create()
female_eyes_brown_tga.picture= File.open("/unitydata/female_eyes_brown.tga")
female_eyes_brown_tga.save!
female_eyes_green_tga = Image.create()
female_eyes_green_tga.picture= File.open("/unitydata/female_eyes_green.tga")
female_eyes_green_tga.save!

    

threedilogo = Image.create()
threedilogo.picture = File.open("#{Rails.root}/app/assets/images/3di_media_server.png")
threedilogo.save!

banner = Image.create()
banner.picture = File.open("#{Rails.root}/app/assets/images/banner.png")
banner.save!



################################################################################################################
#Categories_Products - association table                                                                       #
################################################################################################################

characters.products = [male,female]


################################################################################################################
#Components_Products - association table                                                                       #
################################################################################################################


male.components = [male_pants_1,male_pants_2,male_face_1,male_face_2,male_hair_1,male_hair_2,male_shoes_1,male_shoes_2,male_top_1,male_top_2,male_eyes ]

female.components = [female_pants_1,female_pants_2,female_face_1,female_face_2,female_hair_1,female_hair_2,female_shoes_1,female_shoes_2,female_top_1,female_top_2,female_eyes]


################################################################################################################
#Components_Groups - association table                                                                     #
################################################################################################################




################################################################################################################
#valuefields_properties - association table                                                                     #
################################################################################################################


male_pants_1_blue.property = male_pants_colour
male_pants_1_dark.property = male_pants_colour
male_pants_1_green.property = male_pants_colour
male_pants_1_normal.property = male_pants_colour
male_pants_2_blue.property = male_pants_colour
male_pants_2_lillac.property = male_pants_colour
male_pants_2_normal.property = male_pants_colour
male_pants_2_purple.property = male_pants_colour
female_pants_1_blue.property = female_pants_colour
female_pants_1_dark.property = female_pants_colour
female_pants_1_green.property = female_pants_colour
female_pants_1_normal.property = female_pants_colour
female_pants_2_black.property = female_pants_colour
female_pants_2_blue.property = female_pants_colour
female_pants_2_normal.property = female_pants_colour
female_pants_2_orange.property = female_pants_colour
male_face_1_.property = male_face_colour
male_face_1_normal.property = male_face_colour
male_face_2_.property = male_face_colour
male_face_2_normal.property = male_face_colour
female_face_1_.property = female_face_colour
female_face_1_normal.property = female_face_colour
female_face_2_.property = female_face_colour
female_face_2_normal.property = female_face_colour
male_hair_1_blond.property = male_hair_colour
male_hair_1_brown.property = male_hair_colour
male_hair_1_normal.property = male_hair_colour
male_hair_1_orange.property = male_hair_colour
male_hair_2_blond.property = male_hair_colour
male_hair_2_brown.property = male_hair_colour
male_hair_2_normal.property = male_hair_colour
male_hair_2_red.property = male_hair_colour
female_hair_1_brown.property = female_hair_colour
female_hair_1_normal.property = female_hair_colour
female_hair_1_red.property = female_hair_colour
female_hair_1_yellow.property = female_hair_colour
female_hair_2_cyan.property = female_hair_colour
female_hair_2_dark.property = female_hair_colour
female_hair_2_pink.property = female_hair_colour
male_shoes_1_black.property = male_shoes_colour
male_shoes_1_green.property = male_shoes_colour
male_shoes_1_normal.property = male_shoes_colour
male_shoes_1_red.property = male_shoes_colour
male_shoes_2_brown.property = male_shoes_colour
male_shoes_2_dark.property = male_shoes_colour
male_shoes_2_normal.property = male_shoes_colour
male_shoes_2_red.property = male_shoes_colour
female_shoes_1_blue.property = female_shoes_colour
female_shoes_1_green.property = female_shoes_colour
female_shoes_1_normal.property = female_shoes_colour
female_shoes_1_yellow.property = female_shoes_colour
female_shoes_2_blue.property = female_shoes_colour
female_shoes_2_normal.property = female_shoes_colour
female_shoes_2_red.property = female_shoes_colour
female_shoes_2_yellow.property = female_shoes_colour
male_top_1_blue.property = male_top_colour
male_top_1_normal.property = male_top_colour
male_top_1_pink.property = male_top_colour
male_top_1_yellow.property = male_top_colour
male_top_2_gray.property = male_top_colour
male_top_2_green.property = male_top_colour
male_top_2_normal.property = male_top_colour
male_top_2_orange.property = male_top_colour
female_top_1_blue.property = female_top_colour
female_top_1_green.property = female_top_colour
female_top_1_normal.property = female_top_colour
female_top_1_pink.property = female_top_colour
female_top_2_green.property = female_top_colour
female_top_2_normal.property = female_top_colour
female_top_2_orange.property = female_top_colour
female_top_2_purple.property = female_top_colour
male_eyes_blue.property = male_eyes_colour
male_eyes_brown.property = male_eyes_colour
male_eyes_green.property = male_eyes_colour
female_eyes_blue.property = female_eyes_colour
female_eyes_brown.property = female_eyes_colour
female_eyes_green.property = female_eyes_colour





################################################################################################################
#Valuefields_Images - association table                                                                      #
################################################################################################################


male_pants_1_blue.images=[male_pants_1_blue_tga]
male_pants_1_dark.images=[male_pants_1_dark_tga]
male_pants_1_green.images=[male_pants_1_green_tga]
male_pants_1_normal.images=[male_pants_1_normal_tga]
male_pants_2_blue.images=[male_pants_2_blue_tga]
male_pants_2_lillac.images=[male_pants_2_lillac_tga]
male_pants_2_normal.images=[male_pants_2_normal_tga]
male_pants_2_purple.images=[male_pants_2_purple_tga]
female_pants_1_blue.images=[female_pants_1_blue_tga]
female_pants_1_dark.images=[female_pants_1_dark_tga]
female_pants_1_green.images=[female_pants_1_green_tga]
female_pants_1_normal.images=[female_pants_1_normal_tga]
female_pants_2_black.images=[female_pants_2_black_tga]
female_pants_2_blue.images=[female_pants_2_blue_tga]
female_pants_2_normal.images=[female_pants_2_normal_tga]
female_pants_2_orange.images=[female_pants_2_orange_tga]
male_face_1_.images=[male_face_1__tga]
male_face_1_normal.images=[male_face_1_normal_tga]
male_face_2_.images=[male_face_2__tga]
male_face_2_normal.images=[male_face_2_normal_tga]
female_face_1_.images=[female_face_1__tga]
female_face_1_normal.images=[female_face_1_normal_tga]
female_face_2_.images=[female_face_2__tga]
female_face_2_normal.images=[female_face_2_normal_tga]
male_hair_1_blond.images=[male_hair_1_blond_tga]
male_hair_1_brown.images=[male_hair_1_brown_tga]
male_hair_1_normal.images=[male_hair_1_normal_tga]
male_hair_1_orange.images=[male_hair_1_orange_tga]
male_hair_2_blond.images=[male_hair_2_blond_tga]
male_hair_2_brown.images=[male_hair_2_brown_tga]
male_hair_2_normal.images=[male_hair_2_normal_tga]
male_hair_2_red.images=[male_hair_2_red_tga]
female_hair_1_brown.images=[female_hair_1_brown_tga]
female_hair_1_normal.images=[female_hair_1_normal_tga]
female_hair_1_red.images=[female_hair_1_red_tga]
female_hair_1_yellow.images=[female_hair_1_yellow_tga]
female_hair_2_cyan.images=[female_hair_2_cyan_tga]
female_hair_2_dark.images=[female_hair_2_dark_tga]
female_hair_2_pink.images=[female_hair_2_pink_tga]
male_shoes_1_black.images=[male_shoes_1_black_tga]
male_shoes_1_green.images=[male_shoes_1_green_tga]
male_shoes_1_normal.images=[male_shoes_1_normal_tga]
male_shoes_1_red.images=[male_shoes_1_red_tga]
male_shoes_2_brown.images=[male_shoes_2_brown_tga]
male_shoes_2_dark.images=[male_shoes_2_dark_tga]
male_shoes_2_normal.images=[male_shoes_2_normal_tga]
male_shoes_2_red.images=[male_shoes_2_red_tga]
female_shoes_1_blue.images=[female_shoes_1_blue_tga]
female_shoes_1_green.images=[female_shoes_1_green_tga]
female_shoes_1_normal.images=[female_shoes_1_normal_tga]
female_shoes_1_yellow.images=[female_shoes_1_yellow_tga]
female_shoes_2_blue.images=[female_shoes_2_blue_tga]
female_shoes_2_normal.images=[female_shoes_2_normal_tga]
female_shoes_2_red.images=[female_shoes_2_red_tga]
female_shoes_2_yellow.images=[female_shoes_2_yellow_tga]
male_top_1_blue.images=[male_top_1_blue_tga]
male_top_1_normal.images=[male_top_1_normal_tga]
male_top_1_pink.images=[male_top_1_pink_tga]
male_top_1_yellow.images=[male_top_1_yellow_tga]
male_top_2_gray.images=[male_top_2_gray_tga]
male_top_2_green.images=[male_top_2_green_tga]
male_top_2_normal.images=[male_top_2_normal_tga]
male_top_2_orange.images=[male_top_2_orange_tga]
female_top_1_blue.images=[female_top_1_blue_tga]
female_top_1_green.images=[female_top_1_green_tga]
female_top_1_normal.images=[female_top_1_normal_tga]
female_top_1_pink.images=[female_top_1_pink_tga]
female_top_2_green.images=[female_top_2_green_tga]
female_top_2_normal.images=[female_top_2_normal_tga]
female_top_2_orange.images=[female_top_2_orange_tga]
female_top_2_purple.images=[female_top_2_purple_tga]
male_eyes_blue.images=[male_eyes_blue_tga]
male_eyes_brown.images=[male_eyes_brown_tga]
male_eyes_green.images=[male_eyes_green_tga]
female_eyes_blue.images=[female_eyes_blue_tga]
female_eyes_brown.images=[female_eyes_brown_tga]
female_eyes_green.images=[female_eyes_green_tga]


################################################################################################################
#Components_Valuefields - association table                                                                    #
################################################################################################################


male_pants_1.valuefields = [male_pants_1_blue,male_pants_1_dark,male_pants_1_green,male_pants_1_normal]
male_pants_2.valuefields = [male_pants_2_blue,male_pants_2_lillac,male_pants_2_normal,male_pants_2_purple]
female_pants_1.valuefields = [female_pants_1_blue,female_pants_1_dark,female_pants_1_green,female_pants_1_normal]
female_pants_2.valuefields = [female_pants_2_black,female_pants_2_blue,female_pants_2_normal,female_pants_2_orange]
male_face_1.valuefields = [male_face_1_,male_face_1_normal]
male_face_2.valuefields = [male_face_2_,male_face_2_normal]
female_face_1.valuefields = [female_face_1_,female_face_1_normal]
female_face_2.valuefields = [female_face_2_,female_face_2_normal]
male_hair_1.valuefields = [male_hair_1_blond,male_hair_1_brown,male_hair_1_normal,male_hair_1_orange]
male_hair_2.valuefields = [male_hair_2_blond,male_hair_2_brown,male_hair_2_normal,male_hair_2_red]
female_hair_1.valuefields = [female_hair_1_brown,female_hair_1_normal,female_hair_1_red,female_hair_1_yellow]
female_hair_2.valuefields = [female_hair_2_cyan,female_hair_2_dark,female_hair_2_pink]
male_shoes_1.valuefields = [male_shoes_1_black,male_shoes_1_green,male_shoes_1_normal,male_shoes_1_red]
male_shoes_2.valuefields = [male_shoes_2_brown,male_shoes_2_dark,male_shoes_2_normal,male_shoes_2_red]
female_shoes_1.valuefields = [female_shoes_1_blue,female_shoes_1_green,female_shoes_1_normal,female_shoes_1_yellow]
female_shoes_2.valuefields = [female_shoes_2_blue,female_shoes_2_normal,female_shoes_2_red,female_shoes_2_yellow]
male_top_1.valuefields = [male_top_1_blue,male_top_1_normal,male_top_1_pink,male_top_1_yellow]
male_top_2.valuefields = [male_top_2_gray,male_top_2_green,male_top_2_normal,male_top_2_orange]
female_top_1.valuefields = [female_top_1_blue,female_top_1_green,female_top_1_normal,female_top_1_pink]
female_top_2.valuefields = [female_top_2_green,female_top_2_normal,female_top_2_orange,female_top_2_purple]
male_eyes.valuefields = [male_eyes_blue,male_eyes_brown,male_eyes_green]
female_eyes.valuefields = [female_eyes_blue,female_eyes_brown,female_eyes_green]


################################################################################################################
#DataFiles_Products - association table                                                                        #
################################################################################################################
              

female_fbx.products=[female]
female_idle1.products=[female]
female_item_boots.products=[female]
female_item_pants.products=[female]
female_item_shirt.products=[female]
female_walk.products=[female]
female_walkin.products=[female]


male_fbx.products=[male]
male_idle1.products=[male]
male_item_boots.products=[male]
male_item_pants.products=[male]
male_item_shirt.products=[male]
male_walk.products=[male]




################################################################################################################
#Datafile_Valuefiled - association table                                                                         #
################################################################################################################


male_pants_1_blue.data_files=[male_pants_1_blue_mat]
male_pants_1_dark.data_files=[male_pants_1_dark_mat]
male_pants_1_green.data_files=[male_pants_1_green_mat]
male_pants_2_blue.data_files=[male_pants_2_blue_mat]
male_pants_2_lillac.data_files=[male_pants_2_lillac_mat]
male_pants_2_purple.data_files=[male_pants_2_purple_mat]
female_pants_1_blue.data_files=[female_pants_1_blue_mat]
female_pants_1_dark.data_files=[female_pants_1_dark_mat]
female_pants_1_green.data_files=[female_pants_1_green_mat]
female_pants_2_black.data_files=[female_pants_2_black_mat]
female_pants_2_blue.data_files=[female_pants_2_blue_mat]
female_pants_2_orange.data_files=[female_pants_2_orange_mat]
male_face_1_.data_files=[male_face_1__mat]
male_face_2_.data_files=[male_face_2__mat]
female_face_1_.data_files=[female_face_1__mat]
female_face_2_.data_files=[female_face_2__mat]
male_hair_1_blond.data_files=[male_hair_1_blond_mat]
male_hair_1_brown.data_files=[male_hair_1_brown_mat]
male_hair_1_orange.data_files=[male_hair_1_orange_mat]
male_hair_2_blond.data_files=[male_hair_2_blond_mat]
male_hair_2_brown.data_files=[male_hair_2_brown_mat]
male_hair_2_red.data_files=[male_hair_2_red_mat]
female_hair_1_brown.data_files=[female_hair_1_brown_mat]
female_hair_1_red.data_files=[female_hair_1_red_mat]
female_hair_1_yellow.data_files=[female_hair_1_yellow_mat]
female_hair_2_cyan.data_files=[female_hair_2_cyan_mat]
female_hair_2_dark.data_files=[female_hair_2_dark_mat]
female_hair_2_pink.data_files=[female_hair_2_pink_mat]
male_shoes_1_black.data_files=[male_shoes_1_black_mat]
male_shoes_1_green.data_files=[male_shoes_1_green_mat]
male_shoes_1_red.data_files=[male_shoes_1_red_mat]
male_shoes_2_brown.data_files=[male_shoes_2_brown_mat]
male_shoes_2_dark.data_files=[male_shoes_2_dark_mat]
male_shoes_2_red.data_files=[male_shoes_2_red_mat]
female_shoes_1_blue.data_files=[female_shoes_1_blue_mat]
female_shoes_1_green.data_files=[female_shoes_1_green_mat]
female_shoes_1_yellow.data_files=[female_shoes_1_yellow_mat]
female_shoes_2_blue.data_files=[female_shoes_2_blue_mat]
female_shoes_2_red.data_files=[female_shoes_2_red_mat]
female_shoes_2_yellow.data_files=[female_shoes_2_yellow_mat]
male_top_1_blue.data_files=[male_top_1_blue_mat]
male_top_1_pink.data_files=[male_top_1_pink_mat]
male_top_1_yellow.data_files=[male_top_1_yellow_mat]
male_top_2_gray.data_files=[male_top_2_gray_mat]
male_top_2_green.data_files=[male_top_2_green_mat]
male_top_2_orange.data_files=[male_top_2_orange_mat]
female_top_1_blue.data_files=[female_top_1_blue_mat]
female_top_1_green.data_files=[female_top_1_green_mat]
female_top_1_pink.data_files=[female_top_1_pink_mat]
female_top_2_green.data_files=[female_top_2_green_mat]
female_top_2_orange.data_files=[female_top_2_orange_mat]
female_top_2_purple.data_files=[female_top_2_purple_mat]
male_eyes_blue.data_files=[male_eyes_blue_mat]
male_eyes_brown.data_files=[male_eyes_brown_mat]
male_eyes_green.data_files=[male_eyes_green_mat]
female_eyes_blue.data_files=[female_eyes_blue_mat]
female_eyes_brown.data_files=[female_eyes_brown_mat]
female_eyes_green.data_files=[female_eyes_green_mat]



################################################################################################################
#All Seating Test                                                                                              #
#End of Seed                                                                                                   #
################################################################################################################




  end
end
