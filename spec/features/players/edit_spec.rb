require 'rails_helper'

feature 'User updates a player' do
  scenario 'the player is updated and they see the player show page' do
    player = create(:player, name: "Daryl Dixon", rating: 77, drafted: false)
    new_player_name = "Rick Grimes"
    new_player_rating = 88
    visit player_path(player)

    click_on "Update Player"
    expect(current_path).to eq "/players/#{player.id}/edit"

    fill_in "Player Name", with: new_player_name
    fill_in "Rating", with: new_player_rating
    check 'Drafted'
    click_on 'Update Player'

    expect(current_path).to eq "/players/#{player.id}"
    expect(page).to have_content(new_player_name)
    expect(page).to have_content(new_player_rating)
    expect(page).to have_content("Yes")
  end

  scenario 'invalid player info causes redirect to edit form' do
    original_player = create(:player)

    visit edit_player_path(original_player)

    fill_in "Player Name", with: ""
    click_on "Update Player"

    expect(page).to have_content("Name can't be blank")
  end
end