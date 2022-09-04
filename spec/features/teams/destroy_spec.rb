require 'rails_helper'

feature 'User deletes a team' do
  scenario 'the team is deleted and user is redirected to index' do
    team = create(:team)
    player_count = Player.count
    player_on_team = create(:player, team: team)

    expect(Player.count).to eq player_count + 1

    visit team_path(team)

    click_on "Delete Team"

    expect(current_path).to eq "/teams"
    expect(Player.count).to eq player_count
    expect(page).to_not have_content(team.name)
  end
end