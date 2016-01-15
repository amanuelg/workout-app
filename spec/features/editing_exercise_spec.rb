require "rails_helper"

RSpec.feature "editing exercise" do
    before do
        @owner = User.create!(first_name: "John",last_name: "Doe",email: "owner@example.com", password: "password")
        
        @owner_exercise = @owner.exercises.create(duration_in_min: 45, workout: "Cardio exercise", 
        workout_date: "2016-01-10")
        login_as(@owner)
    end
    
    scenario "with valid inputs" do
        visit "/"
        
        click_link "My Lounge"
        link ="a[href='/users/#{@owner.id}/exercises/#{@owner_exercise.id}/edit']"
        find(link).click
        fill_in "Duration", with: 50
        click_button "Update Exercise"
        
        expect(page).to  have_content("Exercise has been updated")
        expect(page).to have_content(50)
        expect(page).not_to have_content(45)
        
    end
end