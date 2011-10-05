=begin
################################################################################################################
#All Seating Test                                                                                              #
#Begin Seed #2                                                                                                 #
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
textures = Property.create(name:"Texture", description:"Product/Component Texture", field_type:"string")

=begin
################################################################################################################
#ValueFields                                                                                                   #
################################################################################################################
=end
#task2ArmTexture = Valuefield.create(fieldvalue:"All_Seating_Assets/Model_Textures/Series82_0_19/Arms/T2_nov14.png", property_id:textures.id, product_id:nil, component_id:task2Arm.id)
#multiFunctionalArmTexture = Valuefield.create(fieldvalue:"All_Seating_Assets/Model_Textures/Series82_0_19/Arms/MF.png", property_id:textures.id, product_id:nil, component_id:multiFunctionalArm.id)
#twisterArmTexture = Valuefield.create(fieldvalue:"All_Seating_Assets/Model_Textures/Series82_0_19/Arms/TW.png", property_id:textures.id, product_id:nil, component_id:twisterArm.id)
#basicStoolControlTexture = Valuefield.create(fieldvalue:"All_Seating_Assets/Model_Textures/Series82_0_19/Controls/C19.png", property_id:textures.id, product_id:nil, component_id:basicStoolControl.id)
#ssControlAddOnTexture = Valuefield.create(fieldvalue:"All_Seating_Assets/Model_Textures/Series82_0_19/Controls/SS.png", property_id:textures.id, product_id:nil, component_id:ssControlAddOn.id)
#lumbarPlusAddOnTexture = Valuefield.create(fieldvalue:"All_Seating_Assets/Model_Textures/Series82_0_19/Lumbar/LP.png", property_id:textures.id, product_id:nil, component_id:lumbarPlusAddOn.id)
#btoBasicStoolTexture = Valuefield.create(fieldvalue:"All_Seating_Assets/Model_Textures/Series82_0_19/Backs/BT0nov3.png", property_id:textures.id, product_id:nil, component_id:btoBasicStool.id)
#type82BasicStoolTexture = Valuefield.create(fieldvalue:"All_Seating_Assets/Model_Textures/Series82_0_19/Seats/Type82.png", property_id:textures.id, product_id:nil, component_id:type82BasicStool.id)
#base82BasicStoolTexture = Valuefield.create(fieldvalue:"All_Seating_Assets/Model_Textures/Series82_0_19/Bases/Base82.png", property_id:textures.id, product_id:nil, component_id:base82BasicStool.id)
#casterBasicStoolTexture = Valuefield.create(fieldvalue:"All_Seating_Assets/Model_Textures/Series82_0_19/Casters/Casters.png", property_id:textures.id, product_id:nil, component_id:casterBasicStool.id)
#basicBackMeshTexture = Valuefield.create(fieldvalue:"All_Seating_Assets/Model_Textures/Series82_0_19/Back_Meshes/FM-BMESH.png", property_id:textures.id, product_id:nil, component_id:basicBackMesh.id)
#s810RingTexture = Valuefield.create(fieldvalue:"All_Seating_Assets/Model_Textures/Series82_0_19/Rings/S8.png", property_id:textures.id, product_id:nil, component_id:s810Ring.id)
#chairShadowTexture = Valuefield.create(fieldvalue:"All_Seating_Assets/Model_Textures/Series82_0_19/Shadows/shadow.png", property_id:textures.id, product_id:nil, component_id:chairShadow.id)

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
task2Arm.properties = [textures]
multiFunctionalArm.properties = [textures]
twisterArm.properties = [textures]
basicStoolControl.properties = [textures]
ssControlAddOn.properties = [textures]
lumbarPlusAddOn.properties = [textures]
btoBasicStool.properties = [textures]
type82BasicStool.properties = [textures]
base82BasicStool.properties = [textures]
casterBasicStool.properties = [textures]
basicBackMesh.properties = [textures]
s810Ring.properties = [textures]
chairShadow.properties = [textures]

=begin
################################################################################################################
#End of Seed #2                                                                                                #
################################################################################################################
=end




=begin
################################################################################################################
##All Seating Test                                                                                             #
#Begin Seed #1                                                                                                 #
################################################################################################################
=end
#Destroy Tables
=begin
Category.destroy_all
Product.destroy_all
Property.destroy_all
Valuefield.destroy_all
Component.destroy_all
Group.destroy_all

#Categories
all = Category.create(name:"All")
chair = Category.create(name:"Chair", parent_id:all.id)
fluid = Category.create(name:"Fluid", parent_id:chair.id)

#Products
task = Product.create(name:"Task Chair", description:"Fluid Task Chair")
stool = Product.create(name:"Stool Chair", description:"Fluid Stool Chair")
basicTask = Product.create(name:"Basic Chair", description:"Fluid Basic Task Chair")
basicStool = Product.create(name:"Basic Stool Chair", description:"Fluid Basic Stool Chair")
side = Product.create(name:"Side Chair", description:"Fluid Side Chair")
basicSide = Product.create(name:"Basic Side Chair", description:"Fluid Basic Side Chair")

#Groups
arm = Group.create(name:"Chair Arm")
control = Group.create(name:"Chair Tilt Control")
test_group  = Group.create(name:"Test Group")

#Components
#Component Group - Arm
noArm = Component.create(name:"No Arm", description:"Chair with No Arm", group_id: arm.id)
task2Arm = Component.create(name:"Task 2 Arm", description:"Chair with Task 2 Arm", group_id:arm.id)
multiFunctionalArm = Component.create(name:"Multi-Functional Arm", description:"Chair with Multi-Functional Arm", group_id:arm.id)
twisterArm = Component.create(name:"Twister Arm", description:"Chair with Twister Arm", group_id:arm.id)
withArm = Component.create(name:"with Arm", description:"Side Chair with Arms", group_id:arm.id)

#Component Group - Control
deluxeSynchroTilt = Component.create(name:"Deluxe Synchro Tilt", description:"Chair with Deluxe Synchro Tilt", group_id:control.id)
deluxeSynchroTiltWBackAngle = Component.create(name:"Deluxe Synchro Tilt with Back Angle", description:"Chair with Deluxe Synchro Tilt w/ back angle", group_id:control.id)
synchroTilt = Component.create(name:"Synchro Tilt", description:"Chair with Synchro Tilt", group_id:control.id)
basicStoolControl = Component.create(name:"Basic Stool Control", description:"Chair with Basic Stool Control", group_id:control.id)

#Component - no grouping
backMesh = Component.create(name:"Back Mesh", description:"Chair Back Mesh", group_id:nil)
seatMesh = Component.create(name:"Seat Mesh", description:"Chair Seat Mesh", group_id:nil)
basicBackMesh = Component.create(name:"Basic Back Mesh", description:"Chair Basic Back Mesh", group_id:nil)
frameFinish = Component.create(name:"Frame Finish", description:"Chair Frame Finish", group_id:nil)

#Categories_Products - association table
fluid.products = [task, stool, basicTask, basicStool, side, basicSide]

#Components_Products - association table
task.components = [noArm, task2Arm, multiFunctionalArm, twisterArm, deluxeSynchroTilt, deluxeSynchroTiltWBackAngle, synchroTilt, backMesh, seatMesh]
stool.components = [noArm, task2Arm, multiFunctionalArm, twisterArm, basicStoolControl, backMesh, seatMesh]
basicTask.components = [noArm, task2Arm, multiFunctionalArm, twisterArm, deluxeSynchroTilt, deluxeSynchroTiltWBackAngle, synchroTilt, basicBackMesh]
basicStool.components = [noArm, task2Arm, multiFunctionalArm, twisterArm, deluxeSynchroTilt, deluxeSynchroTiltWBackAngle,
                         synchroTilt, basicBackMesh]
side.components = [noArm, withArm, backMesh, frameFinish]
basicSide.components = [noArm, withArm, basicBackMesh, frameFinish]

#Properties
colour = Property.create(name:"Colour", description:"Product/Component Colour", field_type:"string")
finish = Property.create(name:"Finish", description:"Product/Component Finish", field_type:"string")
textures = Property.create(name:"Texture", description:"Product/Component Texture", field_type:"string")

#products_properties

#components_properties
backMesh.properties = [colour, textures] #textures for testing pic path
seatMesh.properties = [colour]
basicBackMesh.properties = [colour]
frameFinish.properties = [finish]

#ValueFields
#Belongs to Component "backMesh"
closedMeshBlackWhiteBack = Valuefield.create(fieldvalue:"Closed Back Mesh Black/White", property_id:colour.id, product_id:nil, component_id:backMesh.id)
openMeshEbonyBack = Valuefield.create(fieldvalue:"Open Back Mesh Ebony", property_id:colour.id, product_id:nil, component_id:backMesh.id)
openMeshCobaltBack = Valuefield.create(fieldvalue:"Open Back Mesh Cobalt", property_id:colour.id, product_id:nil, component_id:backMesh.id)
openMeshSilicaBack = Valuefield.create(fieldvalue:"Open Back Mesh Silica", property_id:colour.id, product_id:nil, component_id:backMesh.id)
openMeshSandstoneBack = Valuefield.create(fieldvalue:"Open Back Mesh Sandstone", property_id:colour.id, product_id:nil, component_id:backMesh.id)

#Belongs to Component "basicBackMesh"
fluidBasicMeshBlackBack= Valuefield.create(fieldvalue:"Fluid Basic Back Mesh Black", property_id:colour.id, product_id:nil, component_id:basicBackMesh.id)

#Belongs to Component "seatMesh"
closedMeshBlackWhiteSeat = Valuefield.create(fieldvalue:"Closed Seat Mesh Black/White", property_id:colour.id, product_id:nil, component_id:seatMesh.id)
openMeshEbonySeat = Valuefield.create(fieldvalue:"Open Seat Mesh Ebony", property_id:colour.id, product_id:nil, component_id:seatMesh.id)
openMeshCobaltSeat = Valuefield.create(fieldvalue:"Open Seat Mesh Cobalt", property_id:colour.id, product_id:nil, component_id:seatMesh.id)
openMeshSilicaSeat = Valuefield.create(fieldvalue:"Open Seat Mesh Silica", property_id:colour.id, product_id:nil, component_id:seatMesh.id)
openMeshSandstoneSeat = Valuefield.create(fieldvalue:"Open Seat Mesh Sandstone", property_id:colour.id, product_id:nil, component_id:seatMesh.id)

#Belongs to Component "frameFinish"
frameFinishSilver = Valuefield.create(fieldvalue:"Silver Frame Finish", property_id:finish.id, product_id:nil, component_id:frameFinish.id)
frameFinishBlack = Valuefield.create(fieldvalue:"Black Frame Finish", property_id:finish.id, product_id:nil, component_id:frameFinish.id)
frameFinishMetallicGunmetal = Valuefield.create(fieldvalue:"Metallic Gunmetal Frame Finish", property_id:finish.id, product_id:nil, component_id:frameFinish.id)
=end

=begin
################################################################################################################
#End of Seed #1                                                                                               #
################################################################################################################
=end

