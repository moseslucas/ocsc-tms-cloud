module SessionsHelper

	def log_in (user)
		session[:user_id] = user.id
    session[:branch] = "master"
	end

	def current_user
		@current_user =  @current_user || User.find_by( id: session[:user_id] )
	end

	def logged_in?
		!current_user.nil?
	end

	def check_session
		session[:user_id]
	end

	def log_out
		session.delete(:user_id)
		session.delete(:branch)
		@current_user = nil
	end

  def authenticate_user
    unless logged_in?
      redirect_to login_path
    end
  end

	def if_not_logged_in_route_to(where)
		if logged_in? == false
			redirect_to where
		end
	end

	def if_not_admin_route_to(where)
		if  @current_user[:user_type] != "admin"
			redirect_to where
		end
	end

end
