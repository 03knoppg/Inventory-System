# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#All Seating Test Seed #2
#Destroy Tables
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
fluidBasicStool = Product.create(name:"Basic Stool Chair", description:"Fluid Basic Stool Chair")

#Groups
arm = Group.create(name:"Chair Arm")
control = Group.create(name:"Chair Tilt Control")
addOnControl = Group.create(name:"Chair Add-On Control")
addOnLumbarPlus = Group.create(name:"Chair Add-On Lumbar Plus")


#Components
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

#Categories_Products - association table
fluid.products = [fluidBasicStool]

#Components_Products - association table
fluidBasicStool.components = [noArm, task2Arm, multiFunctionalArm, twisterArm, basicStoolControl, basicBackMesh,
                              s810Ring, chairShadow, btoBasicStool, type82BasicStool, base82BasicStool, casterBasicStool]

#Components_Components - association table
basicStoolControl.components = [ssControlAddOn, ssControlNone]
btoBasicStool.components = [lumbarPlusAddOn, lumbarPlusNone]

#Properties
textures = Property.create(name:"Texture", description:"Product/Component Texture", field_type:"string")

#components_properties
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

#Value Field for Textures
task2ArmTexture = Valuefield.create(fieldvalue:"home/hans2/All Seating Assets/Model Textures/Series82_0_19/Arms/T2_nov14.png", property_id:textures.id, product_id:nil, component_id:task2Arm.id)
multiFunctionalArm = Valuefield.create(fieldvalue:"/home/hans2/All Seating Assets/Model Textures/Series82_0_19/Arms/MF.png", property_id:textures.id, product_id:nil, component_id:multiFunctionalArm.id)
twisterArmTexture = Valuefield.create(fieldvalue:"/home/hans2/All Seating Assets/Model Textures/Series82_0_19/Arms/TW.png", property_id:textures.id, product_id:nil, component_id:twisterArm.id)
basicStoolControl = Valuefield.create(fieldvalue:"/home/hans2/All Seating Assets/Model Textures/Series82_0_19/Controls/C19.png", property_id:textures.id, product_id:nil, component_id:basicStoolControl.id)
ssControlAddOn = Valuefield.create(fieldvalue:"/home/hans2/All Seating Assets/Model Textures/Series82_0_19/Controls/ss.png", property_id:textures.id, product_id:nil, component_id:ssControlAddOn.id)
lumbarPlusAddOn = Valuefield.create(fieldvalue:"/home/hans2/All Seating Assets/Model Textures/Series82_0_19/Lumbar/LP.png", property_id:textures.id, product_id:nil, component_id:lumbarPlusAddOn.id)
btoBasicStool = Valuefield.create(fieldvalue:"/home/hans2/All Seating Assets/Model Textures/Series82_0_19/Backs/BT0nov3.png", property_id:textures.id, product_id:nil, component_id:btoBasicStool.id)
type82BasicStool = Valuefield.create(fieldvalue:"/home/hans2/All Seating Assets/Model Textures/Series82_0_19/Seats/Type82.png", property_id:textures.id, product_id:nil, component_id:type82BasicStool.id)
base82BasicStool = Valuefield.create(fieldvalue:"/home/hans2/All Seating Assets/Model Textures/Series82_0_19/Bases/Base82.png", property_id:textures.id, product_id:nil, component_id:base82BasicStool.id)
casterBasicStool = Valuefield.create(fieldvalue:"/home/hans2/All Seating Assets/Model Textures/Series82_0_19/Casters/Casters.png", property_id:textures.id, product_id:nil, component_id:casterBasicStool.id)
basicBackMesh = Valuefield.create(fieldvalue:"/home/hans2/All Seating Assets/Model Textures/Series82_0_19/Back Meshes/FM-BMESH.png", property_id:textures.id, product_id:nil, component_id:basicBackMesh.id)
s810Ring = Valuefield.create(fieldvalue:"/home/hans2/All Seating Assets/Model Textures/Series82_0_19/Rings/S8.png", property_id:textures.id, product_id:nil, component_id:s810Ring.id)
chairShadow = Valuefield.create(fieldvalue:"/assets/leopardskin.gif", property_id:textures.id, product_id:nil, component_id:chairShadow.id)


#All Seating Test Seed #1
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

#Components
#Component Group - Arm
noArm = Component.create(name:"No Arm", description:"Chair with No Arm", group_id:arm.id)
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


#_______Original Test Seed
=begin
Category.destroy_all
Product.destroy_all
Property.destroy_all
Valuefield.destroy_all
Component.destroy_all

all = Category.create(name:"All")
toronto = Category.create(name:"Toronto", parent_id:all.id)
montreal = Category.create(name:"Montreal", parent_id:all.id)
vancouver = Category.create(name:"Vancouver", parent_id:all.id)
fakestreet = Category.create(name:"123 Fake Street", parent_id:toronto.id)
somewhere = Category.create(name:"555 Somewhere Road", parent_id:toronto.id)
nowhere = Category.create(name:"In the middle", parent_id:toronto.id)


u222 = Product.create(name:"Unit 222", description:"One bedroom")
u434 = Product.create(name:"Unit 434", description:"Bachelor")
u544 = Product.create(name:"Unit 544", description:"Two Bedroom")
u13  = Product.create(name:"Unit 13", description:"Who would live here?")

all_component = Component.create(name:"All", description:"Root component")
bedroom = Component.create(name:"Bedroom", description:"Nice bedroom")
livingroom = Component.create(name:"Living room", description:"Big living room")
kitchen = Component.create(name:"Kitchen", description:"Functional kitchen")

bed = Component.create(name:"Bed", description:"Big bed")
chair = Component.create(name:"Chair", description:"Soft chair")
couch1 = Component.create(name:"Hide-a-bed", description:"Hide-a-bed")
couch2 = Component.create(name:"Love seat", description:"Love seat")
fridge = Component.create(name:"Fridge", description:"Fridge")
stove = Component.create(name:"Stove", description:"Stove")

colour = Property.create(name:"Colour", description:"The colour", field_type:"string")
bedsize = Property.create(name:"Bed size", description:"The size of the bed", field_type:"string")
size =  Property.create(name:"Size", description:"Vague size of item", field_type:"string")

#blue = Valuefield.create(fieldvalue:"Blue")
#green = Valuefield.create(fieldvalue:"Green")
#red = Valuefield.create(fieldvalue:"Red")
#yellow = Valuefield.create(fieldvalue:"Yellow")

#king = Valuefield.create(fieldvalue:"King")
#queen = Valuefield.create(fieldvalue:"Queen")
#double = Valuefield.create(fieldvalue:"Double")

#big = Valuefield.create(fieldvalue:"Big")
#small = Valuefield.create(fieldvalue:"Small")

#toronto.categories = [fakestreet. somewhere, nowhere]

fakestreet.products = [u222]
somewhere.products = [u434,u544,u13]


u222.components=[bedroom, livingroom, kitchen]
u434.components=[livingroom, kitchen]
u544.components=[bedroom, bedroom, livingroom, kitchen]
u13.components=[kitchen, kitchen, kitchen]

u222.properties = [size]
u434.properties = [size]
u544.properties = [size]
u13.properties = [size]


bedroom.properties = []
livingroom.properties = []
kitchen.properties = []

bed.properties = [bedsize, colour]
chair.properties = [colour]
couch1.properties = [size, colour]
couch2.properties = [size, colour]
fridge.properties = [colour]
stove.properties = [colour]


all_component.components = [bedroom, livingroom, kitchen]

bedroom.components = [bed, chair]
livingroom.components = [chair, bed, couch1, couch2]
kitchen.components = [fridge, stove]


blueBed = Valuefield.create(fieldvalue:"Blue")
blueBed.property = colour
blueBed.component = bed
blueBed.save

kingBed = Valuefield.create(fieldvalue:"King")
kingBed.property = bedsize
kingBed.component = bed
kingBed.save



greenChair = Valuefield.create(fieldvalue:"Green")
greenChair.property = colour
greenChair.component = chair
 greenChair.save


yellowCouch1 = Valuefield.create(fieldvalue:"Yellow")
yellowCouch1.property = colour
yellowCouch1.component = couch1
yellowCouch1.save

bigCouch1 = Valuefield.create(fieldvalue:"Big")
bigCouch1.property = bedsize
bigCouch1.component = couch1
bigCouch1.save




redCouch2 = Valuefield.create(fieldvalue:"Yellow")
redCouch2.property = colour
redCouch2.component = couch2
redCouch2.save

smallCouch2 = Valuefield.create(fieldvalue:"Small")
smallCouch2.property = bedsize
smallCouch2.component = couch2
smallCouch2.save

red_fridge= Valuefield.create(fieldvalue:"Red")
red_fridge.property = colour
red_fridge.component = fridge
red_fridge.save


green_stove= Valuefield.create(fieldvalue:"Green")
green_stove.property = colour
green_stove.component = stove
green_stove.save

big_u222 = Valuefield.create(fieldvalue:"Big")
big_u222.property = size
big_u222.product = u222
big_u222.save

small_u434 = Valuefield.create(fieldvalue:"Small")
small_u434.property = size
small_u434.product = u434
small_u434.save

big_u544 = Valuefield.create(fieldvalue:"Big")
big_u544.property = size
big_u544.product = u544
big_u544.save

big_u13 = Valuefield.create(fieldvalue:"Small")
big_u13.property = size
big_u13.product = u13
big_u13.save




#colour.valuefields = [blue, green, red, yellow]
#bedsize.valuefields = [king, queen, double]
#size.valuefields = [big, small]
=end