require 'rails_helper'

# User Story 1, Parent Index
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
RSpec.describe 'leagues index page', type: :feature do
  before do
    @league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
    @league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)
    @league_3 = League.create!(name: 'league3', professional: false, years_in_existence: 7)
    @league_4 = League.create!(name: 'league4', professional: true, years_in_existence: 3)

    @team_1 = @league_1.teams.create!(name: 'team1', expansion_team: true, number_of_players: 10)
    @team_5 = @league_1.teams.create!(name: 'teams5', expansion_team: true, number_of_players: 14)
    @team_3 = @league_1.teams.create!(name: 'seam3', expansion_team: true, number_of_players: 22)
    @team_4 = @league_4.teams.create!(name: 'team4', expansion_team: false, number_of_players: 53)

    visit '/leagues'
  end

  it 'I see the name of each league record in the system' do

    expect(page).to have_content(@league_1.name)
    expect(page).to have_content(@league_2.name)
    expect(page).to have_content(@league_3.name)
    expect(page).to have_content(@league_4.name)
  end

# User Story 6, Parent Index sorted by Most Recently Created
#
# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
  describe 'As a visitor' do
    describe 'When I visit the League Index Page' do
      it 'I see the leagues sorted by most recently created first' do

        expect(@league_4.name).to appear_before(@league_3.name)
        expect(@league_3.name).to appear_before(@league_2.name)
        expect(@league_2.name).to appear_before(@league_1.name)
      end

      it 'Next to each league I see when it was created' do

        expect(page).to have_content(@league_4.created_at)
        expect(page).to have_content(@league_3.created_at)
        expect(page).to have_content(@league_2.created_at)
        expect(page).to have_content(@league_1.created_at)
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

# User Story 17, Parent Update From Parent Index Page
#
# As a visitor
# When I visit the parent index page
# Next to every parent, I see a link to edit that parent's info
# When I click the link
# I should be taken to that parents edit page where I can update its information just like in User Story 4
      it 'Next to every League I see a link to edit that leagues information' do
        expect(page).to have_content("Edit #{@league_2.name}")
        expect(page).to have_content("Edit #{@league_3.name}")
        expect(page).to have_content("Edit #{@league_4.name}")
        click_link "Edit #{@league_1.name}"

        expect(current_path).to eq("/leagues/#{@league_1.id}/edit")
      end
# User Story 22, Parent Delete From Parent Index Page
#
# As a visitor
# When I visit the parent index page
# Next to every parent, I see a link to delete that parent
# When I click the link
# I am returned to the Parent Index Page where I no longer see that parent
      it 'Next to every league I see a link to delete that league' do
        click_link "Delete #{@league_1.name}"

        expect(current_path).to eq("/leagues")
        expect(page).to_not have_content("#{@league_1.name}")
      end

# Sort Parents by Number of Children
#
# As a visitor
# When I visit the Parents Index Page
# Then I see a link to sort parents by the number of `child_table_name` they have
# When I click on the link
# I'm taken back to the Parent Index Page where I see all of the parents in order of their count of `child_table_name` (highest to lowest) And, I see the number of children next to each parent name
      it 'Then I see a link to sort the league by the number of teams they have' do
        click_link "Sort leagues by team count"

        expect(current_path).to eq("/leagues")
        expect(page).to have_content("Number of teams: 3")
        expect(page).to have_content("Number of teams: 1")
        expect(page).to have_content("Number of teams: 0")
        expect(@league_1).to appear_before(@league_4)
        expect(@league_4).to appear_before(@league_2)
        expect(@league_4).to appear_before(@league_3)
      end
    end
  end
end