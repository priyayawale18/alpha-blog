class ArticlesController < ApplicationController
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
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path	
	end

    private
	def article_params
		params.require(:article).permit(:title,:description, :customer_id)
	end
end
