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
    @team_5 = @league_1.teams.create!(name: 'teams5', expansion_team: true, number_of_players: 14)
    @team_3 = @league_1.teams.create!(name: 'seam3', expansion_team: true, number_of_players: 22)
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

# User Story 16, Sort Parent's Children in Alphabetical Order by name
#
# As a visitor
# When I visit the Parent's children Index Page
# Then I see a link to sort children in alphabetical order
# When I click on the link
# I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order

  it 'Then I see a link to sort the teams in alphabetical order' do
    click_link('Sort Teams Alphabetically')

    expect(@team_3.name).to appear_before(@team_1.name)
    expect(@team_1.name).to appear_before(@team_5.name)
    expect(current_path).to eq("/leagues/#{@league_1.id}/teams")
  end

# User Story 18, Child Update From Childs Index Page
#
# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to edit that child's info
# When I click the link
# I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
  it 'Next to the team I see a link to edit the teams information' do
    click_link "Edit #{@team_1.name}"

    expect(current_path).to eq("/teams/#{@team_1.id}/edit")
  end

# User Story 21, Display Records Over a Given Threshold
#
# As a visitor
# When I visit the Parent's children Index Page
# I see a form that allows me to input a number value
# When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
# Then I am brought back to the current index page with only the records that meet that threshold shown.
  it 'I see a form that allows me to input value' do
    fill_in 'Teams with players over', with: '10'
    click_button 'Only return teams with more than 10 players'

    expect(page).to have_content("#{@team_3.name}")
    expect(page).to have_content("#{@team_5.name}")
    expect(page).to_not have_content("#{@team_1.name}")
  end

# User Story 23, Child Delete From Childs Index Page
#
# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to delete that child
# When I click the link
# I should be taken to the `child_table_name` index page where I no longer see that child
  it 'Next to the Team I see a link to delete the team' do
    click_link "Delete #{@team_1.name}"

    expect(current_path).to eq("/teams")
    expect(page).to_not have_content("#{@team_1.name}")
  end
end