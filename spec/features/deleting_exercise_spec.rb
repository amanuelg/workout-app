require "rails_helper"

RSpec.feature "deleting exercises" do
    before do
        @owner = User.create!(first_name: "John",last_name: "Doe",email: "owner@example.com", password: "password")
        
        @owner_exercise = @owner.exercises.create(duration_in_min: 45, workout: "Cardio exercise", 
        workout_date: "2016-01-10")
        login_as(@owner)
    end
    
    scenario do
        visit "/"
        click_link "My Lounge"
        
        link = "//a[contains(@href, '/users/#{@owner.id}/exercises/#{@owner_exercise.id}') and .//text()='Destroy']"
        find(:xpath,link).click
        expect(page).to have_content("Exercise has been deleted")
    end
end