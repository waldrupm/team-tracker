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
  scenario 'invalid info is entered and they see the new player form' do
    team = create(:team)
    visit new_team_player_path(team)
    fill_in "Rating", with: "77"
    check 'Drafted'
    click_on "Create Player"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_http_status(:unprocessable_entity)
  end
end