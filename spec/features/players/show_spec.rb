require 'rails_helper'

describe "player show page" do
  context "when valid id is given" do
    it "shows all player info" do
      player = FactoryBot.create(:player)

      visit player_path(player)

      expect(page).to have_content(player.name)
      expect(page).to have_content(player.drafted ? 'Yes' : 'No')
      expect(page).to have_content(player.rating)
      expect(page).to have_content(player.team.name)
    end
  end
end