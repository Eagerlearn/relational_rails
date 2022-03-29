require 'rails_helper'

RSpec.describe 'editing and existing league', type: :feature do
  before do
    @league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
    @league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)
    @league_3 = League.create!(name: 'league3', professional: false, years_in_existence: 7)
    @league_4 = League.create!(name: 'league4', professional: true, years_in_existence: 9)

    @team_2 = @league_3.teams.create!(name: 'team2', expansion_team: true, number_of_players: 10)
    @team_3 = @league_3.teams.create!(name: 'team3', expansion_team: false, number_of_players: 53)

    visit "/leagues/#{@league_3.id}"
  end

# User Story 12, Parent Update
#
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
describe 'As a vistor' do
  describe 'When I visit the league show page' do
      it 'Then I see a link to update the league' do
        click_link "Update #{@league_3.name}"

        expect(current_path).to eq("/leagues/#{@league_3.id}/edit")
      end

      it 'can update the league' do
        visit "/leagues/#{@league_3.id}/edit"

        fill_in 'name', with: 'change1'
        fill_in 'professional', with: 'False'
        fill_in 'years_in_existence', with: '11'
        click_button 'Submit'

        expect(current_path).to eq("/leagues/#{@league_3.id}")
      end
    end
  end
end