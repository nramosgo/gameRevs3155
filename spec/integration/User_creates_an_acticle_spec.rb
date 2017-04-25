require 'rails_helper.rb'

feature "User creates a article"do
    scenario "User successfully navigates to the new article page from the account page" do
        visit new_account_path
        fill_in "Username", with: "Username Test"
        fill_in "Password", with: "Password Test"
        click_button('Create Account')
        click_link('Create Article')
        expect(page).to have_content("NEW ARTICLE")
        expect(page).to have_field('Title')
        expect(page).to have_field('Maintext')
        expect(page).to have_field('Image')
        expect(page).to have_field('Tag1')
        expect(page).to have_field('Tag2')
        expect(page).to have_field('Tag3')
    end
    
    scenario "User successfully creates a article" do
        visit new_account_path
        fill_in "Username", with: "Username Test"
        fill_in "Password", with: "Password Test"
        click_button('Create Account')
        click_link('Create Article')
        fill_in "Title", with: "Title test"
        fill_in "Maintext", with: "Main test"
        fill_in "Image", with: "Image test"
        fill_in "Tag1", with: "Tag1 test"
        fill_in "Tag2", with: "Tag2 test"
        fill_in "Tag3", with: "Tag3 test"
        click_button('Save Article')
        expect(page).to have_content("Title test")
        expect(page).to have_content("Main test")
        expect(page).to have_content("Tag1 test")
        expect(page).to have_content("Tag2 test")
        expect(page).to have_content("Tag3 test")
    end
end