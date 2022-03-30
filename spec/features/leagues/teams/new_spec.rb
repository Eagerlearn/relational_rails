require 'rails_helper'

RSpec.describe 'creating a new team for a specific league', type: :feature do
  before do
    @league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
    @league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)

    @team_1 = @league_1.teams.create!(name: 'team1', expansion_team: true, number_of_players: 10)
    @team_5 = @league_1.teams.create!(name: 'team5', expansion_team: true, number_of_players: 14)
    @team_4 = @league_2.teams.create!(name: 'team4', expansion_team: false, number_of_players: 53)

    visit "/leagues/#{@league_1.id}/teams"
  end

  # User Story 13, Parent Child Creation
  #
  # As a visitor
  # When I visit a Parent Childs Index page
  # Then I see a link to add a new adoptable child for that parent "Create Child"
  # When I click the link
  # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
  # When I fill in the form with the child's attributes:
  # And I click the button "Create Child"
  # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
  # a new child object/row is created for that parent,
  # and I am redirected to the Parent Childs Index page where I can see the new child listed

  describe 'As a visitor' do
    describe 'When I visit the League Teams Index Page' do
      it 'Then I see a link to add a new adoptable team for that league' do
        click_link 'Create Team'

        expect(current_path).to eq("/leagues/#{@league_1.id}/teams/new")

        fill_in 'name', with: 'new team'
        fill_in 'expansion_team', with: 'True'
        fill_in 'number_of_players', with: '32'
        click_button 'Create Team'

        expect(current_path).to eq("/leagues/#{@league_1.id}/teams")
        expect(page).to have_content('new team')
      end
    end
  end
end