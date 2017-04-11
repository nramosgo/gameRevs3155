class ReviewsController < ApplicationController
    def new
        @account = Account.find(params[:account_id])
        @review = Review.new
        
    end
    
    def create
         @account = Account.find(params[:account_id])
       
    end

end
