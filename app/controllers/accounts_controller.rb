class AccountsController < ApplicationController
    def new
        @account = Account.new
    end
    
    def create
       
        @account = Account.new(account_params)
        @userName = @account.userName
        if Account.exists?(userName: @userName)
            #get existing account from db and redirect
            print @userName
            @account = Account.where(userName: @userName).take
            @account_id = @account.id
         
            redirect_to account_path(@account_id)
            #render 'new'
        elsif @account.save
            #creates new record if not existing and redirects
            redirect_to @account
        else
            render 'new'
        end
    
    end
    
    def show
        @account = Account.find(params[:id])
        @account_id=params[:account_id]
        
        @articles= Article.where(account_id: @account_id)
       
    end
end

private
    def account_params
        params.require(:account).permit(:userName, :password)
    end
