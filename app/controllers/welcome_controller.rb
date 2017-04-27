class WelcomeController < ApplicationController
  def index
    @account = Account.all;
    @review = Review.all;
    
    
  end
end
