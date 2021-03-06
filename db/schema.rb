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

ActiveRecord::Schema.define(:version => 20111207201044) do

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
    t.integer  "group_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_components", :id => false, :force => true do |t|
    t.integer "component_parent_id"
    t.integer "component_child_id"
  end

  create_table "components_data_files", :id => false, :force => true do |t|
    t.integer "component_id"
    t.integer "data_file_id"
  end

  create_table "components_images", :id => false, :force => true do |t|
    t.integer "component_id"
    t.integer "image_id"
  end

  create_table "components_products", :id => false, :force => true do |t|
    t.integer "component_id"
    t.integer "product_id"
  end

  create_table "components_properties", :id => false, :force => true do |t|
    t.integer "component_id"
    t.integer "property_id"
  end

  create_table "components_valuefields", :id => false, :force => true do |t|
    t.integer "component_id"
    t.integer "valuefield_id"
  end

  create_table "data_files", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filedata_file_name"
    t.string   "filedata_content_type"
    t.integer  "filedata_file_size"
    t.datetime "filedata_updated_at"
  end

  create_table "data_files_products", :id => false, :force => true do |t|
    t.integer "data_file_id"
    t.integer "product_id"
  end

  create_table "data_files_valuefields", :id => false, :force => true do |t|
    t.integer "data_file_id"
    t.integer "valuefield_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "images_products", :id => false, :force => true do |t|
    t.integer "image_id"
    t.integer "product_id"
  end

  create_table "images_valuefields", :id => false, :force => true do |t|
    t.integer "image_id"
    t.integer "valuefield_id"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_properties", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "property_id"
  end

  create_table "products_valuefields", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "valuefield_id"
  end

  create_table "properties", :force => true do |t|
    t.string   "field_type"
    t.string   "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "table_aliases", :force => true do |t|
    t.string   "tableName"
    t.string   "aliasName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updaterecords", :force => true do |t|
    t.string   "table_name"
    t.integer  "entry_id"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "updaterecords", ["table_name", "entry_id"], :name => "index_updaterecords_on_table_name_and_entry_id", :unique => true
  add_index "updaterecords", ["time"], :name => "index_updaterecords_on_time"

  create_table "users", :force => true do |t|
    t.string   "username",                                       :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer  "failed_logins_count",             :default => 0
    t.datetime "lock_expires_at"
  end

  add_index "users", ["activation_token"], :name => "index_users_on_activation_token"
  add_index "users", ["last_logout_at", "last_activity_at"], :name => "index_users_on_last_logout_at_and_last_activity_at"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

  create_table "validations", :force => true do |t|
    t.string   "extension"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "valuefields", :force => true do |t|
    t.string   "fieldvalue"
    t.integer  "property_id"
    t.string   "path"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
