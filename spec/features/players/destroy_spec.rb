require 'rails_helper'

feature 'User destroys a player' do
  scenario 'the player is destroyed and the user is redirected to the players index' do
    team = create(:team)
    player = create(:player, team: team)
    visit player_path(player)
    click_on 'Delete Player'
    expect(page).to have_current_path(players_path)
    expect(page).to_not have_content(player.name)
  end
end