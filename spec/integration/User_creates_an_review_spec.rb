require 'rails_helper.rb'

feature"User creates a review"do
    scenario "User successfully navigates to the new review page from the account page" do
        visit new_account_path
        fill_in "Username", with: "Username Test"
        fill_in "Password", with: "Password Test"
        click_button('Create Account')
        click_link('Create Review')
        expect(page).to have_content("NEW REVIEW")
        expect(page).to have_field('Title')
        expect(page).to have_field('Maintext')
        expect(page).to have_field('Rating')
        expect(page).to have_field('Image')
        expect(page).to have_field('Tag1')
        expect(page).to have_field('Tag2')
        expect(page).to have_field('Tag3')
    end
    
    scenario "User successfully creates a review" do
        visit new_account_path
        fill_in "Username", with: "Username Test"
        fill_in "Password", with: "Password Test"
        click_button('Create Account')
        click_link('Create Review')
        fill_in "Title", with: "Title test"
        fill_in "Maintext", with: "Main test"
        fill_in "Rating", with: "Rating test"
        fill_in "Image", with: "Image test"
        fill_in "Tag1", with: "Tag1 test"
        fill_in "Tag2", with: "Tag2 test"
        fill_in "Tag3", with: "Tag3 test"
        click_button('Create Review')
        expect(page).to have_content("Show stuff")
        
    end
end

