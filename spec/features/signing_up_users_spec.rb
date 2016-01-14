require "rails_helper"

RSpec.feature "Signing up users" do
    scenario "signing up user with valid credentials" do
        visit "/"
        click_link "Sign up"
        
        fill_in "First name", with: "Jhon"
        fill_in "Last name", with: "Doe"
        fill_in "Email", with:"jhone@example.com"
        fill_in "Password", with:"password"
        fill_in "Password confirmation", with:"password"
        click_button "Sign up"
        
        expect(page).to have_content("You have signed up successfully.")
        
        expect(page).to have_content("Jhon Doe")
        
    end
    
    scenario "signing up user with invalid credentials" do
        visit "/"
        click_link "Sign up"
        
        fill_in "First name", with: ""
        fill_in "Last name", with: ""
        fill_in "Email", with:"jhone@example.com"
        fill_in "Password", with:"password"
        fill_in "Password confirmation", with:"password"
        click_button "Sign up"
        
        expect(page).to have_content("First name can't be blank")
        expect(page).to have_content("Last name can't be blank")
        
    end
end