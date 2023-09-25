class UserLogsController < ApplicationController

	def new
		@user_log = UserLog.new
	end	
    
    def create
    	@user_log = UserLog.new(email: params[:email] , username: params[:username], password: params[:password])
    	if @user_log.save
    		flash[:success] = "Welcome to the Alpha Blog #{@user_log.username}, You have sucessfully Sign Up!"
        	redirect_to articles_path
    	else
    		render 'new'
    	end	
    end

    private
    def user_params
    	params.require(:user_logs).permit(:username, :email, :password)
    end
	
end


