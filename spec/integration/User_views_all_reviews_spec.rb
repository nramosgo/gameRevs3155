require 'rails_helper.rb'

feature"User views all reviews" do
    scenario "User successfully navigates to the all reviews page from the home page" do
    visit welcome_index_path
    click_button('All Reviews')
    click_link('All Reviews')
    expect(page).to have_content("Showing stuff")
    end
end