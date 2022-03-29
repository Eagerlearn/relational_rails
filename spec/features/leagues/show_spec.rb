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

  describe 'As a vistor' do
    describe 'When I visit the league show page' do
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

# User Story 10, Parent Child Index Link
#
# As a visitor
# When I visit a parent show page ('/parents/:id')
# Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
      it 'Then I see a link to take me to the leagues team index page' do
        expect(page).to have_link('League Team Index Page')

        click_link('League Team Index Page')

        expect(current_path).to eq("/leagues/#{@league_3.id}/teams")
      end
    end
  end
end