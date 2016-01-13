require "rails_helper"

RSpec.feature "listing exercises" do
    before do
        @jhon = User.create!(email: "jhon@example.com", password: "password")
        login_as(@jhon)
        
        @e1 = @jhon.exercises.create!(:duration_in_min => 60, :workout => "lifting weight", :workout_date => "2016-01-12" )
        @e2 = @jhon.exercises.create!(:duration_in_min => 60, :workout => "Running", :workout_date => "2016-01-11" )
    end
    
    scenario "listing exercises for the last 7 days" do
        visit "/"
        
        click_link "My Launge"
        expect(page).to have_content(@e1.duration_in_min)
        expect(page).to have_content(@e1.workout)
        expect(page).to have_content(@e1.workout_date)
        expect(page).to have_content(@e2.duration_in_min)
        expect(page).to have_content(@e2.workout)
        expect(page).to have_content(@e2.workout_date)
        
        
    end
end