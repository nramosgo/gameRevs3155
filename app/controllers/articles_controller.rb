class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end
    
    def create
        @account = Account.find(params[:account_id])
        #just for refrences as what to do @article = Article.find(params[:article_id])
        @article = @account.articles.create(article_params)
        #just for reference as what to do @comment = @article.comments.create(comment_params)
       
        if @article.save
            redirect_to account_article_path(@account.id, @account.articles, @article.id) #  need to change this to go to show page
            
        else
            render 'new'
        end
    end
    
    def show
        @account = Account.find(params[:account_id])
        @account_id=params[:account_id]
        @articles= Article.where(account_id: @account_id)
    end
end
private
    def article_params
        params.required(:article).permit(:title, :mainText, :image, :tag1, :tag2, :tag3)
    end