class ApplicationController < ActionController::Base

 include ApplicationHelper

 helper_method :current_user, :logged_in?

 def current_user
   user = UserLog.find_by(id: session[:user_id])
  if user.present?
   @current_user ||= UserLog.find(session[:user_id]) if session[:user_id]
  end
 end

 def logged_in?
     !!current_user
 end


 def require_user
      if !logged_in?
        flash[:alert]= "You must be logged in to perform that action"
        redirect_to login_path
      end 
  end

  

end
