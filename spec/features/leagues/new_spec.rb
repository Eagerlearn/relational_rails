require 'rails_helper'

RSpec.describe 'creating a new league', type: :feature do
  before do
    @league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
    @league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)
    @league_3 = League.create!(name: 'league3', professional: false, years_in_existence: 7)
    @league_4 = League.create!(name: 'league4', professional: true, years_in_existence: 3)

    visit '/leagues'
  end

# User Story 11, Parent Creation
#
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

  describe 'As a visitor' do
    describe 'When I visit the League Index Page' do
      it 'Then I see a link to create a new League' do
        click_link 'New League'

        expect(current_path).to eq('/leagues/new')

        fill_in 'name', with: 'new1'
        fill_in 'professional', with: 'True'
        fill_in 'years_in_existence', with: '6'
        click_on 'Create League'

        expect(current_path).to eq('/leagues')
        expect(page).to have_content('new1')
      end
    end
  end
end