class SessionsController < ApplicationController

	def new
	end

	def create
		user = UserLog.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "Log In Successfully ! Welcome #{user.username}"
        redirect_to user
        else
        flash.now[:success] = "There was something wrong with your login details"
        puts "There was something wrong with your login details"
        render 'new'
    end
	end

	def destroy
		    session[:user_id] = nil
            flash[:notice] = "Logged out"
            redirect_to root_path
	end
	
end
