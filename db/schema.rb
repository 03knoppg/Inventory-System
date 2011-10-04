# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110921143220) do

  create_table "categories", :force => true do |t|
    t.integer  "parent_id"
    t.string   "name"
    t.string   "code_category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_products", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  create_table "components", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "group_id"
    t.string   "code_component"
    t.string   "model_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_components", :id => false, :force => true do |t|
    t.integer "component_parent_id"
    t.integer "component_child_id"
  end

  create_table "components_products", :id => false, :force => true do |t|
    t.integer "component_id"
    t.integer "product_id"
  end

  create_table "components_properties", :id => false, :force => true do |t|
    t.integer "component_id"
    t.integer "property_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "code_product"
    t.string   "model_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_properties", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "property_id"
  end

  create_table "properties", :force => true do |t|
    t.string   "field_type"
    t.string   "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "valuefields", :force => true do |t|
    t.string   "fieldvalue"
    t.integer  "property_id"
    t.integer  "product_id"
    t.integer  "component_id"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
