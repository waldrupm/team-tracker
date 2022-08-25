require 'rails_helper'

describe "the players index page" do
  it "shows the list of players with data" do
    player1 = create(:player)
    player2 = create(:player)
    player3 = create(:player)

    visit players_path

    expect(page).to have_content(player1.name)
    expect(page).to have_content(player1.drafted ? 'Yes' : 'No')
    expect(page).to have_content(player1.rating)
    expect(page).to have_content(player2.name)
    expect(page).to have_content(player2.drafted ? 'Yes' : 'No')
    expect(page).to have_content(player2.rating)
    expect(page).to have_content(player3.name)
    expect(page).to have_content(player3.drafted ? 'Yes' : 'No')
    expect(page).to have_content(player3.rating)
  end
end