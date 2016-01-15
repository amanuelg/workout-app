require "rails_helper"

RSpec.feature "searching for user" do
    before do
        @jhon = User.create!(first_name: "Jhon", last_name: "Doe", email: "jhondoe@example.com", password: "password")
        @sara = User.create!(first_name: "Sara", last_name: "Doe", email: "saraclay@example.com", password: "password")
    end
    
    scenario "with existing userr returns all those users" do
        visit "/"
        
        fill_in "search_name", with: "Doe"
        click_button "Search"
        
        expect(page).to have_content(@jhon.full_name)
        expect(page).to have_content(@sara.full_name)
        expect(current_path).to eq("/dashboard/search")
    end
end