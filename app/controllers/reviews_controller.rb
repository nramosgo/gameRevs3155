class ReviewsController < ApplicationController
    def new
        @review = Review.new
        
    end
    
    def create
       @account = Account.find(params[:account_id])
        
        @review = @account.reviews.new(review_params)
        
        if @review.save
            
            puts @review.id    
            redirect_to account_review_path(@account.id, @account.reviews, @review.id, id: @review.id)
            
             #change to show page
        else
             render 'new'
            
        end
        
    end
    
    def show
        @account = Account.find(params[:account_id])
        @account_id=params[:account_id]
        @reviews= Review.where(account_id: @account_id)
        @review = Review.find(params[:id])
       
    end
    
    def destroy
        
        @account = Account.find(params[:account_id])
        @account_id = params[:account_id]
        @reviews= Review.where(account_id: @account_id)
        @review.destroy

        redirect_to accounts_path
    end
end

private
    def review_params
        params.required(:review).permit(:title, :mainText, :rating, :image, :tag1, :tag2, :tag3)
    end