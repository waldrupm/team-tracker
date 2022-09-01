require 'rails_helper'

feature 'User creates a new player' do
  scenario 'the player is created and they see the team players index' do
    player_name = "Daryl Dixon"
    rating = 77
    team = create(:team)
    visit new_team_player_path(team)
    fill_in "Player Name", with: player_name
    fill_in "Rating", with: rating
    check 'Drafted'
    click_on "Create Player"

    expect(current_path).to eq "/teams/#{team.id}/players"
    expect(page).to have_content(player_name)
    expect(page).to have_content(rating)
    expect(page).to have_content("Yes")
  end
end