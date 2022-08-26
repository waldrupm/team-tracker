require 'rails_helper'

describe "team player list page" do
  context "with valid team id" do
    it "shows a list of players on that team" do
      team = create(:team)
      player1 = create(:player, team: team)
      player2 = create(:player, team: team)
      player3 = create(:player, team: team)
      player_not_on_team = create(:player)

      visit team_player_list_path(team)

      expect(page).to have_content(player1.name)
      expect(page).to have_content(player2.name)
      expect(page).to have_content(player3.name)
      expect(page).to_not have_content(player_not_on_team.name)
    end
  end
end