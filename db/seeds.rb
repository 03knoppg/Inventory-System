# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all
Product.destroy_all
Attribute.destroy_all
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

colour = Attribute.create(name:"Colour", description:"The colour", field_type:"string")
bedsize = Attribute.create(name:"Bed size", description:"The size of the bed", field_type:"string")
size =  Attribute.create(name:"Size", description:"Vague size of item", field_type:"string")

blue = Valuefield.create(fieldvalue:"Blue")
green = Valuefield.create(fieldvalue:"Green")
red = Valuefield.create(fieldvalue:"Red")
yellow = Valuefield.create(fieldvalue:"Yellow")

king = Valuefield.create(fieldvalue:"King")
queen = Valuefield.create(fieldvalue:"Queen")
double = Valuefield.create(fieldvalue:"Double")

big = Valuefield.create(fieldvalue:"Big")
small = Valuefield.create(fieldvalue:"Small")

#toronto.categories = [fakestreet. somewhere, nowhere]

fakestreet.products = [u222]
somewhere.products = [u434,u544,u13]


u222.components=[bedroom, livingroom, kitchen]
u434.components=[livingroom, kitchen]
u544.components=[bedroom, bedroom, livingroom, kitchen]
u13.components=[kitchen, kitchen, kitchen]

all_component.components = [bedroom, livingroom, kitchen]

bedroom.components = [bed, chair]
livingroom.components = [chair, bed, couch1, couch2]
kitchen.components = [fridge, stove]

bed.valuefields = [blue, king]
chair.valuefields = [green]
couch1.valuefields = [yellow,big]
couch2.valuefields = [red,small]
fridge.valuefields = [red]
stove.valuefields = [green]

u222.valuefields = [big]
u434.valuefields = [small]
u544.valuefields = [big]
u13.valuefields = [small]


colour.valuefields = [blue, green, red, yellow]
bedsize.valuefields = [king, queen, double]
size.valuefields = [big, small]