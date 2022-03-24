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

    expect(page).to have_content(@league_1.professional)
    expect(page).to have_content(@league_2.professional)
    expect(page).to have_content(@league_3.professional)
    expect(page).to have_content(@league_4.professional)

    expect(page).to have_content(@league_1.years_in_existence)
    expect(page).to have_content(@league_2.years_in_existence)
    expect(page).to have_content(@league_3.years_in_existence)
    expect(page).to have_content(@league_4.years_in_existence)
  end
end