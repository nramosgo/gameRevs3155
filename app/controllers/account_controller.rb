class AccountController < ApplicationController
    def new
        @account = Account.new
    end
    
    def create
       
       @account = Account.new(account_params)
        
        if @account.save
            redirect_to @account
        else
            render 'new'
        end
    
    end
end

private
    def account_params
        params.required(:account).permit(:username, :password)
    end
