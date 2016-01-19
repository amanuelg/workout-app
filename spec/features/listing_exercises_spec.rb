require "rails_helper"

RSpec.feature "listing exercises" do
    before do
        @jhon = User.create!(first_name: "John",last_name: "Doe",email: "jhon@example.com", password: "password")
        @sara = User.create!(first_name: "Sara",last_name: "Doe",email: "sara@example.com", password: "password")
        login_as(@jhon)
        
        @e1 = @jhon.exercises.create!(:duration_in_min => 60, :workout => "lifting weight", :workout_date => Date.today )
        @e2 = @jhon.exercises.create!(:duration_in_min => 60, :workout => "Running", :workout_date => Date.today )
        
        @following = Friendship.create!(user: @jhon, friend: @sara)
    end
    
    scenario "listing exercises for the last 7 days" do
        visit "/"
        
        click_link "My Lounge"
        expect(page).to have_content(@e1.duration_in_min)
        expect(page).to have_content(@e1.workout)
        expect(page).to have_content(@e1.workout_date)
        expect(page).to have_content(@e2.duration_in_min)
        expect(page).to have_content(@e2.workout)
        expect(page).to have_content(@e2.workout_date)
        
    end
    
    scenario "show a list of users friends" do
        visit "/"
        
        click_link "My Lounge"
        expect(page).to have_content("My Friends")
        expect(page).to have_link(@sara.full_name)
        expect(page).to have_link("Unfollow")
    end
    
end