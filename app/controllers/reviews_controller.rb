class ReviewsController < ApplicationController
    def new
        @review = Review.new
        
    end
    
    def create
       @review = Review.create(review_params)
       
        if @review.save
             redirect_to @review
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