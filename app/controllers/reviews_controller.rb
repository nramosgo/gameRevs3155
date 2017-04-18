class ReviewsController < ApplicationController
    def new
        @review = Review.new
        
    end
    
    def create
       @account = Account.find(params[:account_id])
        
        @review = @account.reviews.new(review_params)
        
        if @review.save
             redirect_to @account.reviews
             
             #change to show page
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