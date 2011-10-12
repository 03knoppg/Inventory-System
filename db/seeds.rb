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

=begin
################################################################################################################
#Users                                                                                                         #
################################################################################################################
=end
brett = User.create(username:"bh", email:"bh@bh.com", password:"bh")
graham = User.create(username:"gk", email:"gk@gk.com", password:"gk")

=begin
################################################################################################################
#Categories                                                                                                    #
################################################################################################################
=end
all = Category.create(name:"All")
chair = Category.create(name:"Chair", parent_id:all.id)
fluid = Category.create(name:"Fluid", parent_id:chair.id)

=begin
################################################################################################################
#Products                                                                                                      #
################################################################################################################
=end
fluidBasicStool = Product.create(name:"Basic Stool Chair", description:"Fluid Basic Stool Chair")

=begin
################################################################################################################
#Data_file                                                                                                     #
################################################################################################################
=end
testDAE = DataFile.create(product_id: fluidBasicStool.id)
testDAE.filedata = File.open("/var/www/allseating/bin/chairs/dae/No_Textures_version_Series82_0_19.DAE")
testDAE.save!

=begin
################################################################################################################
#Groups                                                                                                        #
################################################################################################################
=end
#Groups below represent an "or" choice
arm = Group.create(name:"Chair Arm")
control = Group.create(name:"Chair Tilt Control")
addOnControl = Group.create(name:"Chair Add-On Control")
addOnLumbarPlus = Group.create(name:"Chair Add-On Lumbar Plus")

=begin
################################################################################################################
#Components                                                                                                    #
################################################################################################################
=end
#Component Group - Arm
noArm = Component.create(name:"No Arm", description:"Chair with No Arm", group_id:arm.id)
task2Arm = Component.create(name:"Task 2 Arm", description:"Chair with Task 2 Arm", group_id:arm.id)
multiFunctionalArm = Component.create(name:"Multi-Functional Arm", description:"Chair with Multi-Functional Arm", group_id:arm.id)
twisterArm = Component.create(name:"Twister Arm", description:"Chair with Twister Arm", group_id:arm.id)

#Component Group - Control
basicStoolControl = Component.create(name:"Basic Stool Control", description:"Chair with Basic Stool Control", group_id:control.id)

#Component Group - Optional Control
ssControlAddOn = Component.create(name:"Chair Control Add-On", description:"Control Add-On for a chair (Additional to regular controls)", group_id:addOnControl.id)
ssControlNone = Component.create(name:"Chair Control No Add-On", description:"Control with no Add-On Control for a chair", group_id:addOnControl.id)

#Component Group = Optional Lumbar Plus
lumbarPlusAddOn = Component.create(name:"Chair Lumbar Add-On", description:"Lumbar Plus Add-on for a chair", group_id:addOnLumbarPlus.id)
lumbarPlusNone = Component.create(name:"Chair Lumbar No Add-On", description:"Lumbar Plus no Add-On for chair", group_id:addOnLumbarPlus.id)

#Fluid Basic Stool Components - no group - required components for chair
btoBasicStool = Component.create(name:"Fluid Basic Stool Back", description:"Back type for the Fluid Basic Stool", group_id:nil)
type82BasicStool = Component.create(name:"Fluid Basic Stool Seat", description:"Seat type for the Fluid Basic Stool", group_id:nil)
base82BasicStool = Component.create(name:"Fluid Basic Stool Base", description:"Base type for the Fluid Basic Stool", group_id:nil)
casterBasicStool = Component.create(name:"Fluid Basic Stool Casters", description:"Caster type for the Fluid Basic Stool", group_id:nil)
basicBackMesh = Component.create(name:"Basic Back Mesh", description:"Chair Basic Back Mesh", group_id:nil)
s810Ring = Component.create(name:"Chair Ring", description:"Ring type for a Chair", group_id:nil)
chairShadow = Component.create(name:"Chair Shadow", description:"Shadow for the Chair Model", group_id:nil)

=begin
################################################################################################################
#Properties                                                                                                    #
################################################################################################################
=end
#textures = Property.create(name:"Texture", description:"Product/Component Texture", field_type:"string")

fabrics = Property.create(name: "Fabric", description: "Product/Component Fabric", field_type: "string")

=begin
################################################################################################################
#ValueFields                                                                                                   #
################################################################################################################
=end

f4_pcaber = Valuefield.create(fieldvalue: "Fabric F4-PCABER", property_id: fabrics.id, component_id: type82BasicStool.id)

=begin
################################################################################################################
#Images                                                                                                        #
################################################################################################################
=end
btoBasicStoolImage = Image.create(component_id: btoBasicStool.id)
btoBasicStoolImage.picture = File.open("/var/www/allseating/bin/chairs/textures/Series82_0_19/BT0nov3.png")
btoBasicStoolImage.save!

basicControlImage = Image.create(component_id: basicStoolControl.id)
basicControlImage.picture = File.open("/var/www/allseating/bin/chairs/textures/Series82_0_19/C19.png")
basicControlImage.save!

task2ArmImage = Image.create(component_id: task2Arm.id)
task2ArmImage.picture = File.open("/var/www/allseating/bin/chairs/textures/Series82_0_19/T2.png")
task2ArmImage.save!

multiFunctionalArmImage = Image.create(component_id: multiFunctionalArm.id)
multiFunctionalArmImage.picture = File.open("/var/www/allseating/bin/chairs/textures/Series82_0_19/MF.png")
multiFunctionalArmImage.save!

twisterArmImage = Image.create(component_id: twisterArm.id)
twisterArmImage.picture = File.open("/var/www/allseating/bin/chairs/textures/Series82_0_19/TW.png")
twisterArmImage.save!

ssControlAddOnImage = Image.create(component_id: ssControlAddOn.id)
ssControlAddOnImage.picture = File.open("/var/www/allseating/bin/chairs/textures/Series82_0_19/SS.png")
ssControlAddOnImage.save!

lumbarPlusAddOnImage = Image.create(component_id: lumbarPlusAddOn.id)
lumbarPlusAddOnImage.picture = File.open("/var/www/allseating/bin/chairs/textures/Series82_0_19/LP.png")
lumbarPlusAddOnImage.save!

type82BasicStoolImage = Image.create(component_id: type82BasicStool.id)
type82BasicStoolImage.picture = File.open("/var/www/allseating/bin/chairs/textures/Series82_0_19/Type82.png")
type82BasicStoolImage.save!

base82BasicStoolImage = Image.create(component_id: base82BasicStool.id)
base82BasicStoolImage.picture = File.open("/var/www/allseating/bin/chairs/textures/Series82_0_19/Base82.png")
base82BasicStoolImage.save!

casterBasicStoolImage = Image.create(component_id: casterBasicStool.id)
casterBasicStoolImage.picture = File.open("/var/www/allseating/bin/chairs/textures/Series82_0_19/Casters.png")
casterBasicStoolImage.save!

basicBackMeshImage = Image.create(component_id: basicBackMesh.id)
basicBackMeshImage.picture = File.open("/var/www/allseating/bin/chairs/textures/Series82_0_19/FM-BMESH.png")
basicBackMeshImage.save!

s810RingImage = Image.create(component_id: s810Ring.id)
s810RingImage.picture = File.open("/var/www/allseating/bin/chairs/textures/Series82_0_19/S8.png")
s810RingImage.save!

chairShadowImage = Image.create(component_id: chairShadow.id)
chairShadowImage.picture = File.open("/var/www/allseating/bin/chairs/textures/Series82_0_19/shadow.png")
chairShadowImage.save!

f4_pcaberImage = Image.create(valuefield_id: f4_pcaber.id)
f4_pcaberImage.picture = File.open("/var/www/allseating/bin/chairs/textures/F4-PCABER.jpg")
f4_pcaberImage.save!

=begin
################################################################################################################
#Categories_Products - association table                                                                       #
################################################################################################################
=end
fluid.products = [fluidBasicStool]

=begin
################################################################################################################
#Components_Products - association table                                                                       #
################################################################################################################
=end
fluidBasicStool.components = [noArm, task2Arm, multiFunctionalArm, twisterArm, basicStoolControl, basicBackMesh,
                              s810Ring, chairShadow, btoBasicStool, type82BasicStool, base82BasicStool, casterBasicStool]
=begin
################################################################################################################
#Components_Components - association table                                                                     #
################################################################################################################
=end
basicStoolControl.components = [ssControlAddOn, ssControlNone]
btoBasicStool.components = [lumbarPlusAddOn, lumbarPlusNone]

=begin
################################################################################################################
#components_properties - association table                                                                     #
################################################################################################################
=end
type82BasicStool.properties = [fabrics]

#task2Arm.properties = [textures]
#multiFunctionalArm.properties = [textures]
#twisterArm.properties = [textures]
#basicStoolControl.properties = [textures]
#ssControlAddOn.properties = [textures]
#lumbarPlusAddOn.properties = [textures]
#btoBasicStool.properties = [textures]
##base82BasicStool.properties = [textures]
#casterBasicStool.properties = [textures]
#basicBackMesh.properties = [textures]
#s810Ring.properties = [textures]
#chairShadow.properties = [textures]

=begin
################################################################################################################
#End of Seed                                                                                               #
################################################################################################################
=end
