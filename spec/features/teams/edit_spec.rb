require 'rails_helper'

RSpec.describe 'editing and existing team', type: :feature do
  before do
    @league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
    @league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)
    @league_3 = League.create!(name: 'league3', professional: false, years_in_existence: 7)
    @league_4 = League.create!(name: 'league4', professional: true, years_in_existence: 9)

    @team_2 = @league_3.teams.create!(name: 'team2', expansion_team: true, number_of_players: 10)
    @team_3 = @league_3.teams.create!(name: 'team3', expansion_team: false, number_of_players: 53)

    visit "/teams/#{@team_3.id}"
  end

# User Story 14, Child Update
#
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

describe 'As a vistor' do
  describe 'When I visit the team show page' do
      it 'Then I see a link to update the team' do
        click_link "Update #{@team_3.name}"

        expect(current_path).to eq("/teams/#{@team_3.id}/edit")
      end

      it 'can update the team' do
        visit "/teams/#{@team_3.id}/edit"

        fill_in 'name', with: 'change5'
        fill_in 'expansion_team', with: 'True'
        fill_in 'number_of_players', with: '22'
        click_button "Update #{@team_3.name}"

        expect(current_path).to eq("/teams/#{@team_3.id}")
      end
    end
  end
end