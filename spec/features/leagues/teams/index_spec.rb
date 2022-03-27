require 'rails_helper'
# User Story 5, Parent Children Index

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated
# with that Parent with each Child's attributes:

RSpec.describe 'League Team Index page' do
  before do
    @league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
    @league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)

    @team_1 = @league_1.teams.create!(name: 'team1', expansion_team: true, number_of_players: 10)
    @team_5 = @league_1.teams.create!(name: 'team5', expansion_team: true, number_of_players: 14)
    @team_4 = @league_2.teams.create!(name: 'team4', expansion_team: false, number_of_players: 53)

    visit "/leagues/#{@league_1.id}/teams"
  end

  it 'Then I see each team that is associated with the league and its attributes' do

    expect(page).to have_content(@team_1.name)
    expect(page).to have_content(@team_1.expansion_team)
    expect(page).to have_content(@team_1.number_of_players)

    expect(page).to have_content(@team_5.name)
    expect(page).to have_content(@team_5.expansion_team)
    expect(page).to have_content(@team_5.number_of_players)

    expect(page).to_not have_content(@team_4.name)
    expect(page).to_not have_content(@team_4.expansion_team)
    expect(page).to_not have_content(@team_4.number_of_players)
  end
end