class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login
  private
  def not_authenticated
    redirect_to login_url, :alert => "First log in to view this page."
  end
end
