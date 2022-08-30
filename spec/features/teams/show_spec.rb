require 'rails_helper'

describe 'the team show page' do
  context 'when given a valid id' do
    it 'shows all team info' do
      team = create(:team)

      visit team_path(team)
      
      expect(page).to have_content(team.name)
      expect(page).to have_content(team.pro ? 'Yes' : 'No')
      expect(page).to have_content(team.last_year_finish)
    end
  end
  context 'when given an invalid id' do
    it 'responds with 404' do
      visit team_path(777777)

      expect(page).to have_http_status(:not_found)
    end
  end

  feature 'User updates a team' do
    scenario 'the team is updated and user see updated info' do
      original_team = create(:team, pro: false)
      new_name = "Edited TeamName"
      new_last_year_finish = 3

      visit team_path(original_team)

      click_on "Update Team"
      expect(current_path).to eq "/teams/#{original_team.id}/edit"
      fill_in "team_name", with: new_name
      fill_in "Last year finish", with: new_last_year_finish
      check 'Pro Team'
      click_on "Update Team"

      expect(current_path).to eq "/teams/#{original_team.id}"
      expect(page).to have_content(new_name)
      expect(page).to have_content(new_last_year_finish)
      expect(page).to have_content("Yes")
    end
  end
end