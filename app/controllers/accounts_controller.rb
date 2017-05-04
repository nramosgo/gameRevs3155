class AccountsController < ApplicationController
    def new
        @account = Account.new
    end
    
    def index
        @accounts = Account.all
        @reviews = Review.all
        @articles = Article.all
    end
    
    def create
       
        @account = Account.new(account_params)
        @userName = @account.userName
        @password = @account.password
        if Account.exists?(userName: @userName)
            @account = Account.where(userName: @userName).take
            
            if @account.password.eql?(@password)
                @account_id = @account.id
                redirect_to account_path(@account_id)
            else
                flash[:notice] = "*Incorrect password"
                redirect_to new_account_path 
            end
        elsif @account.save
            #creates new record if not existing and redirects
            redirect_to @account
        else
            flash[:notice] = "*Username and/or password too short"
            redirect_to new_account_path
        end
    
    end
    
    def show
        @account = Account.find(params[:id])
        @account_id=@account.id
        
        @articles= Article.where(account_id: @account_id)
        @reviews = Review.where(account_id: @account_id)
       
    end
end

private
    def account_params
        params.require(:account).permit(:userName, :password)
    end
