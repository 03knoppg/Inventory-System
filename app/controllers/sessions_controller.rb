class SessionsController < ApplicationController

  skip_before_filter :require_login, :except => [:destroy]

  def index
    redirect_to login_url
  end

  def new
    arms = params[:ARMS]
  end

  def create
    user = login(params[:username], params[:password], params[:remember_me])
    if user
      redirect_back_or_to admin_path, :notice => "Logged in!"
    else
      flash[:alert] = "Email or password was invalid."
      redirect_to login_url
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end

end
