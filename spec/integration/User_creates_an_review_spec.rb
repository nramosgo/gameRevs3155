require 'rails_helper.rb'

feature"User creates a review"do
    scenario "User successfully navigates to the new review page from the account page"
    expect(page).to have_field('Title')
    
    
    end


end

