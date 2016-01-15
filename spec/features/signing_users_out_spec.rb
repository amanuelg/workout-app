require "rails_helper"

RSpec.feature "User Sign out" do
    
    before do
        @jhon = User.create!(first_name: "John",last_name: "Doe",:email => "jhon@example.com", :password => "password", :password_confirmation => "password")
        visit "/"
        
        click_link "Log in"
        fill_in "Email", with: @jhon.email
        fill_in "Password", with:"#{@jhon.password}"
        click_button "Log in"
    end
    
    scenario "user sign out" do
        visit "/"
        click_link "Sign out"
        expect(page).to have_content("Signed out successfully.")
        
    end
end