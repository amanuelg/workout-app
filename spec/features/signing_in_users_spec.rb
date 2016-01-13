require "rails_helper"

RSpec.feature "Signing In user" do
    
    before do
        @jhon = User.create(:email => "jhon@example.com", :password => "password", :password_confirmation => "password")
    end
    scenario "user sign in with valid credentials" do
        visit "/"
        
        click_link "Log in"
        fill_in "Email", with:"#{@jhon}"
        fill_in "Password", with:"password"
        click_button "Log in"
        
        expect(page).to have_content("Logged in successfully")
        expect(page).to have_content("Logged in as #{@jhon.email}")
        
    end
end