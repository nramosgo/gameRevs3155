class ReviewsController < ApplicationController
    def new
        @review = Review.new
        
    end
    
    def create
        @review = @account.reviews.create(review_params)
       
        if @review.save
            redirect_to @review
        else
            render 'new'
        end
    end
    

end

private
    def review_params
        params.required(:review).permit(:title, :mainText, :rating, :date, :image, :tag1, :tag2, :tag3)
    end