class SessionsController < ApplicationController
  include SessionsHelper
  skip_before_action :authenticate_user
  layout "sessions"
	#login page
  def new
  	if logged_in? == true
  		redirect_to root_path
  	end
  end

  def create
    user = User.find_by(name: params[:f_name])
    if user && user.authenticate(params[:f_password])
    	log_in(user)
      render :json=> {status:"success", id:user.id}.as_json
    else
      render :json=> {status:"error"}.as_json
    end
  end

  def destroy
  	log_out
    redirect_to login_path
  end

  def switch
    session[:branch] = params[:branch]
    redirect_to root_path
  end


end
