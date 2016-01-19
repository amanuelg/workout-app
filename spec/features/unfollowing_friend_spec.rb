require "rails_helper"

RSpec.feature "Unfollowing a friend" do
    before do
        @john = User.create(first_name: "john", last_name: "Doe", email: "JohnDoe@example.com", password: "password")
        @sarah = User.create(first_name: "Sarah", last_name: "Doe", email: "sarah@example.com", password: "password")
        
        login_as(@john)
        
        @following = Friendship.create(user_id: @john.id, friend_id: @sarah.id)
    end
    
    scenario "Unfollowing a friend" do
        visit "/"
        
        click_link "My Lounge"
        link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
        find(link).click
        
        expect(page).to have_content("#{@sarah.full_name} unfollowed")
    end
end