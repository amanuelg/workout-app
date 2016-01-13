require "rails_helper"

RSpec.feature "Creating Exercise" do
    before do
        @jhon = User.create!(email: "jhon@example.com", password: "password")
        login_as(@jhon)
    end
    
    scenario "with valid inputs" do
        visit "/"
        click_link "My Launge"
        click_link "New Workout"
        expect(page).to have_link("Back")
        
        fill_in "Duration", with: 70
        fill_in "Workout Detail", with: "Weight lifting"
        fill_in "Activity date", with: "2015-08-07"
        click_button "Create Exercise"
        
        expect(page).to have_content("Exercise has been created")
        
        exercise = Exercise.last
        expect(page.current_path).to eq(user_exercise_path(@jhon,exercise))
    end
end