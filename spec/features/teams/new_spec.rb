require 'rails_helper'

feature 'User creates a new team' do
  scenario 'the team is created and they see the index' do
    team_name = "VB Rockstars"
    last_year_finish = 20

    visit teams_path
    click_on "New Team"
    fill_in "team_name", with: team_name
    fill_in "Last year finish", with: last_year_finish
    check 'Pro Team'
    click_on "Create Team"

    expect(page).to have_content(team_name)
  end
end