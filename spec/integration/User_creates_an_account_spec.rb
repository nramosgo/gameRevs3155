require 'rails_helper.rb'

feature"User creates an account" do
    scenario "User successfully navigates to the new account page from the home page" do
       visit welcome_index_path
       click_button('Login/Sign-Up')
       click_link('Login/Sign-Up')
       expect(page).to have_content("Choose a username and password")
       expect(page).to have_field("Username")
       expect(page).to have_field('Password')
    end
    


    scenario "User successfully creates a new account" do
        visit new_account_path
        expect(page).to have_content("Choose a username and password")
        fill_in "Username", with: "Username Test"
        fill_in "Password", with: "Password Test"
        click_button "Create Account"
        expect(page). to have_content("Name of user")
        find_button('Create Review').click
        find_button('Create Article').click
    end
end
