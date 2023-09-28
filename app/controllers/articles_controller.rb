class ArticlesController < ApplicationController

before_action :require_same_user, only: [:edit, :update]


	def show
	   @article=Article.find(params[:id])
	end

	def index
		 #@article = Article.paginate(page: params[:page], per_page: 5)
		 @articles = Article.paginate(:page => params[:page], :per_page => 5)
	end

	def new
        @article = Article.new
	end

	def create
        @article = Article.new(article_params)
       @article.user_log = current_user
        if @article.save
        	flash[:notice] = "Article Add successful!"
        	redirect_to articles_path
        else
          render 'new'	
        end
	end

	def edit
		@article = Article.find_by(id: params[:id])
	end


	def update
		@article = Article.find_by(id: params[:id])
		if @article.update(article_params)
			flash[:notice] = "Article Updated successful!"
			redirect_to articles_path
		else
          render 'edit'
	  end
	end  

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path	
	end

    private
	def article_params
		params.require(:article).permit(:title,:description, category_ids: [])
	end

 	def require_same_user
 	 @article = Article.find(params[:id])
     @user = UserLog.find(@article.user_log_id)
     if current_user != @user && !current_user.admin?
      flash[:success]= "You Can Only edit your own article"
        redirect_to @user
      end
    end
	


end
