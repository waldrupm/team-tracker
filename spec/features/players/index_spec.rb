require 'rails_helper'

describe "the players index page" do
  it "shows the list of players data with drafted status of true" do
    player1 = create(:player, rating: 110, drafted: true)
    player2 = create(:player, rating: 109, drafted: true)
    player3 = create(:player, rating: 55, drafted: false)

    visit players_path

    expect(page).to have_content(player1.name)
    expect(page).to have_content(player1.rating)
    expect(page).to have_content(player2.name)
    expect(page).to have_content(player2.rating)
    expect(page).to_not have_content(player3.name)
    expect(page).to_not have_content('No')
    expect(page).to_not have_content(player3.rating)
  end
end