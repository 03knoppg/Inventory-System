# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TestDBRubymineProject::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address    => "localhost",
  :port       => 25,
  :domain     => "mail.3disolutions.com",
  #:authentication => :login,
  #:user_name => "",
  #:password => "",
}

