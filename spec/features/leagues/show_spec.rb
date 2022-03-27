require 'rails_helper'
# User Story 2, Parent Show
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

RSpec.describe 'leagues show page', type: :feature do
  before do
    @league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
    @league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)
    @league_3 = League.create!(name: 'league3', professional: false, years_in_existence: 7)
    @league_4 = League.create!(name: 'league4', professional: true, years_in_existence: 9)

    @team_2 = @league_3.teams.create!(name: 'team2', expansion_team: true, number_of_players: 10)
    @team_3 = @league_3.teams.create!(name: 'team3', expansion_team: false, number_of_players: 53)

    visit "/leagues/#{@league_3.id}"
  end

  it 'I see the league with that id including that leagues attributes' do

    expect(page).to have_content(@league_3.name)
    expect(page).to have_content(@league_3.professional)
    expect(page).to have_content(@league_3.years_in_existence)

    expect(page).to_not have_content(@league_1.name)
    expect(page).to_not have_content(@league_1.professional)
    expect(page).to_not have_content(@league_1.years_in_existence)

    expect(page).to_not have_content(@league_2.name)
    expect(page).to_not have_content(@league_2.years_in_existence)

    expect(page).to_not have_content(@league_4.name)
    expect(page).to_not have_content(@league_4.professional)
    expect(page).to_not have_content(@league_4.years_in_existence)
  end

# User Story 7, Parent Child Count
#
# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent
  it 'I see a count of the number of Teams associated with this league' do

    expect(page).to have_content("Number of Teams: 2")
  end
end