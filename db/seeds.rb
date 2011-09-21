# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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