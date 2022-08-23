require 'rails_helper'

describe 'the teams index page' do
  it 'shows the name of each team' do
    team_1 = Team.create(name:  "Jaguars",
                          pro:  true,
                          last_year_finish: 32)
    team_2 = Team.create(name:  "Tide",
                          pro: false,
                          last_year_finish: 4)
                        
    visit '/teams'

    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_2.name)
  end
end