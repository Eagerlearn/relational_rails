require 'rails_helper'
# User Story 3, Child Index
#
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:
RSpec.describe 'teams index page' do
  before do
    @league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
    @league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)

    @team_1 = @league_1.teams.create!(name: 'team1', expansion_team: true, number_of_players: 10)
    @team_4 = @league_2.teams.create!(name: 'team4', expansion_team: false, number_of_players: 53)

    visit '/teams'
  end
  it 'I see each expansion team in the system including the teams attributes' do

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

# User Story 15, Child Index only shows `true` Records
#
# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`
  it 'Then I only see records where the boolean column is true' do
    expect(page).to have_content(@team_1.name)
    expect(page).to have_content(@team_1.expansion_team)
    expect(page).to have_content(@team_1.number_of_players)

    expect(page).to_not have_content(@team_4.name)
    expect(page).to_not have_content(@team_4.expansion_team)
    expect(page).to_not have_content(@team_4.number_of_players)
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