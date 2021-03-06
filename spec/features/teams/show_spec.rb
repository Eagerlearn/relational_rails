require 'rails_helper'
# User Story 4, Child Show
#
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

RSpec.describe 'Team show page' do
  before do
    @league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
    @league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)
    @league_4 = League.create!(name: 'league4', professional: true, years_in_existence: 20)
    @league_5 = League.create!(name: 'league5', professional: true, years_in_existence: 15)


    @team_1 = @league_1.teams.create!(name: 'team1', expansion_team: true, number_of_players: 10)
    @team_4 = @league_2.teams.create!(name: 'team4', expansion_team: false, number_of_players: 53)
    @team_6 = @league_5.teams.create!(name: 'team6', expansion_team: true, number_of_players: 25)
    @team_5 = @league_4.teams.create!(name: 'team5', expansion_team: true, number_of_players: 17)

    visit "/teams/#{@team_1.id}"
  end

  it 'I see the team with that id including the teams attributes' do

    expect(page).to have_content(@team_1.name)
    expect(page).to have_content(@team_1.expansion_team)
    expect(page).to have_content(@team_1.number_of_players)

    expect(page).to_not have_content(@team_4.name)
    expect(page).to_not have_content(@team_4.expansion_team)
    expect(page).to_not have_content(@team_4.number_of_players)
  end

# User Story 8, Child Index Link
#
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index
  it 'Then I see a link at the top of the page that takes me to the Team index' do
    expect(page).to have_link('Team Index Page')

    click_link('Team Index Page')

    expect(current_path).to eq('/teams')
  end
# User Story 9, Parent Index Link

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index
  it 'Then I see a link at the top of the page that takes me to the League index' do
    expect(page).to have_link('League Index Page')

    click_link('League Index Page')

    expect(current_path).to eq('/leagues')
  end

# User Story 20, Child Delete
#
# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child
  it 'Then I see a link to delete the team' do
    click_link "Delete #{@team_1.name}"

    expect(current_path).to eq("/teams")

    expect(page).to_not have_content(@team_1.name)
    # expect(page).to_not have_content(@team_1.expansion_team)
    expect(page).to_not have_content(@team_1.number_of_players)
  end
end