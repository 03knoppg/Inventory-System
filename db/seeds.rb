# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
Product.delete_all

all = Category.create(name:"All")
bedroom = Category.create(name:"Bedroom", parent_id:all.id)
livingroom = Category.create(name:"Living Room", parent_id:all.id)


Product.create(name:"Comfy chair", description:"Very soft chair").categories=[bedroom, livingroom]
Product.create(name:"Hard chair", description:"Very hard chair").categories=[livingroom]
Product.create(name:"Big chair", description:"Very big chair").categories=[bedroom, livingroom]
Product.create(name:"Small chair", description:"Very small chair").categories=[bedroom]
Product.create(name:"Comfy bed", description:"Very soft bed").categories=[bedroom]
Product.create(name:"Hard bed", description:"Very hard bed").categories=[bedroom]
Product.create(name:"Big bed", description:"Very big bed").categories=[bedroom]
Product.create(name:"Small bed", description:"Very small bed").categories=[bedroom]