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

    visit "/leagues/#{@league_3.id}"
  end

  it 'I see the league with that id including that leagues attributes' do

    expect(page).to have_content(@league_3.name)
    expect(page).to have_content(@league_3.professional)
    expect(page).to have_content(@league_3.years_in_existence)

    expect(page).to_not have_content(@league_1.name)
    expect(page).to_not have_content(@league_1.professional)
    expect(page).to_not have_content(@league_1.years_in_existence)

    expect(page).to_not have_content(@league_2.name)
    # expect(page).to_not have_content(@league_2.professional)
    expect(page).to_not have_content(@league_2.years_in_existence)

    expect(page).to_not have_content(@league_4.name)
    expect(page).to_not have_content(@league_4.professional)
    expect(page).to_not have_content(@league_4.years_in_existence)
  end
end