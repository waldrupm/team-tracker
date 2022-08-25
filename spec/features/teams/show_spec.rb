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
end