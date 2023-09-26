class UserLogsController < ApplicationController


  def show
    @user_log = UserLog.find(params[:id])
    @articles = @user_log.articles.paginate(:page => params[:page], :per_page => 5)
  end

  def index
  	@user_log=UserLog.paginate(:page => params[:page], :per_page => 5)
  end


	def new
		@user_log = UserLog.new
	end	

	def edit
		@user_log = UserLog.find_by(id: params[:id])
	end	
    
    def update
    	@user_log = UserLog.find_by(id: params[:id])
    	if @user_log.update(user_params)
           flash[:success] = "Your account information was sucessfully update"
           redirect_to articles_path
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
    	params.require(:user_log).permit(:username, :email, :password)
    end
	
end


