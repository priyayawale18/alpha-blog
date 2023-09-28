class UserLogsController < ApplicationController

before_action :require_same_user, only: [:edit, :update, :destory]




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
    	@user_log = UserLog.create(email: params[:user_log][:email] , username: params[:user_log][:username], password: params[:user_log][:password])
      if @user_log.save
    		flash[:success] = "Welcome to the Alpha Blog #{@user_log.username}, You have sucessfully Sign Up!"
        	redirect_to articles_path
    	else
    		render 'new'
        
    	end	
    end


    def destroy        
      @user = UserLog.find(params[:id])
        @user.destroy
        session[:user_id]=nil if @user == current_user
        flash[:success]="Account and all associated articles sucessfully deleted"
        redirect_to articles_path
     end

    private
    def user_params
    	params.require(:user_log).permit(:username, :email, :password)
    end

    def require_same_user
     @user = UserLog.find(params[:id])
     if current_user != @user && !current_user.admin?
      flash[:success]= "You Can Only edit your own account"
        redirect_to @user
    end
  end
	
end


