require "rails_helper"

RSpec.feature "Following Friends" do
    
    before do
        @jhon = User.create!(first_name: "John",last_name: "Doe",:email => "jhon@example.com", :password => "password", :password_confirmation => "password")
        @ama = User.create!(first_name: "Amanuel",last_name: "Hailu",:email => "amanuel@example.com", :password => "password", :password_confirmation => "password")
        login_as(@jhon)
    end
    
    scenario "if signed in succeeds" do
        visit "/"
        
        expect(page).to have_content(@jhon.full_name)
        expect(page).to have_content(@ama.full_name)
        expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@jhon.id}")
        
        link = "a[href='/friendships?friend_id=#{@ama.id}']"
        find(link).click
        
        expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@ama.id}")
        
    end
    
end