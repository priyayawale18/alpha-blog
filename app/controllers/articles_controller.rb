class ArticlesController < ApplicationController
	def show
	   @article=Article.find(params[:id])
	end

	def index
		@article =Article.all
	end

	def new
        @article = Article.new
	end

	def create
        @article = Article.new(article_params)
        if @article.save
        	redirect_to articles_path
        end
	end

	def edit
		@article = Article.find_by(id: params[:id])
	end

	def update
		@article = Article.find_by(id: params[:id])
		if @article.update(article_params)
			redirect_to articles_path
		end
	end
	private

	def destroy
       @article = Article.find(params[:id])
       @article.destroy

        redirect_to articles_path
    end

	def article_params
		params.require(:article).permit(:title,:description)
	end
end