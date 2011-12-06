class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login
  private
  def not_authenticated
    redirect_to login_url, :alert => "First log in to view this page."
  end

  def current_path
    session[:rq] = request.path_parameters
    #@jumpto = session[:rq]
  end
end
