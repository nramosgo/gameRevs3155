class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.create(article_params)
       
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    
    def show
        @article = Article.find(params[:id])
    end
end
private
    def article_params
        params.required(:article).permit(:title, :mainText, :date, :image, :tag1, :tag2, :tag3)
    end