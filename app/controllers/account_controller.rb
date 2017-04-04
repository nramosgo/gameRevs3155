class AccountController < ApplicationController
    def new
    end
    
    def create
       
       @account = Account.new(account_params)
        
        @account.save
        redirect_to @account
    end
end

private
    def account_params
        params.required(:account).permit(:username, :password)
    end
