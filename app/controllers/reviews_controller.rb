class ReviewsController < ApplicationController
    def new
        @review = Review.new
        
    end
    
    def create
       @account = Account.find(params[:account_id])
        #just for refrences as what to do @article = Article.find(params[:article_id])
        @review = @account.reviews.create(article_params)
        #just for reference as what to do @comment = @article.comments.create(comment_params)
       
        if @review.save
             redirect_to @account
        else
             render 'new'
            
        end
        
    end
    
    def show
        @review = Review.find(params[:id])
    end
end

private
    def review_params
        params.required(:review).permit(:title, :mainText, :rating, :image, :tag1, :tag2, :tag3)
    end