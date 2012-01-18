# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  #config.use_transactional_fixtures = true
end

# Webrat configuration
Webrat.configure do |config|
  config.mode = :rails
end

#Function to create a category
def create_category(name, parent_id, code)
  return category = Category.create(name: name, parent_id: parent_id, code_category: code)
end

#Function to create a product
def create_product(name, description, code)
  return product = Product.create(name: name, description: description, code: code)
end

#Function to create a component
def create_component(name, description, group_id, code)
    return component = Component.create(name: name, description: description, group_id: group_id, code: code)
end

#Function to create a group
def create_group(name)
    return group = Group.create(name: name)
end

#Function to create a property
def create_property(field_type, description, name)
    return property = Property.create(field_type: field_type, description: description, name: name)
end

#Function to create a data file
def create_data_file(address)
  data_file = DataFile.create()
  data_file.filedata = File.open(File.join(address))    #"allseating/bin/chairs/dae/No_Textures_version_Series82_0_19.DAE"
  data_file.save!
  return data_file
end

#Function to create a image
def create_image(address)
  image = Image.create()
  image.picture = File.open(File.join(address))        #"allseating/bin/chairs/textures/Series82_0_19/grey_sm.png"
  image.save!
  return image
end

#Function to create a valuefield
def create_valuefield(fieldvalue, property_id, path, code)
    return valuefield = Valuefield.create(fieldvalue: fieldvalue, property_id: property_id, path: path, code: code)
end

#Function to create a validation
def create_validation(extension, kind)
    return validation = Validation.create(extension: extension, kind: kind)
end

#Function to create a table alias
def create_table_alias(tableName, aliasName)
    return table_alias = TableAlias.create(tableName: tableName, aliasName: aliasName)
end


