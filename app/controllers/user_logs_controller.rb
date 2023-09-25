class UserLogsController < ApplicationController

  def show
    @user_log = UserLog.find(params[:id])
    @articles = @user_log.articles
  end


	def new
		@user_log = UserLog.new
	end	

	def edit
		@user_log=UserLog.find(params[:id])
	end	
    
    def update
    	@user_log=UserLog.find(params[:id])
    	if @user_log.update(user_params)
           flash[:notice] = "Your acoount information was sucessfully update"
    	else
    	  render 'edit'
    	end  	

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

    
    def user_params
    	params.require(:user_logs).permit(:username, :email, :password)
    end
	
end


