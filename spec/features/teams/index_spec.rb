require 'rails_helper'

describe 'the teams index page' do
  it 'shows the name of each team' do
    team_1 = create(:team)
    team_2 = create(:team)
                        
    visit teams_path

    puts page.body

    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_2.name)
  end
end