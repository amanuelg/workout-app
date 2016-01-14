require "rails_helper"

RSpec.feature "listing members" do
    
    before do
        @jhon = User.create!(first_name: "Jhon", last_name: "Doe", email: "jhondoe@example.com", password: "password")
        @sara = User.create!(first_name: "Sara", last_name: "Clay", email: "saraclay@example.com", password: "password")
    end
    
    scenario "show a list of registered members"     do
        visit "/"    
        
        expect(page).to have_content("List of Members")
        expect(page).to have_content(@jhon.full_name)
        expect(page).to have_content(@sara.full_name)
    end
end