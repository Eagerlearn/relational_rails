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