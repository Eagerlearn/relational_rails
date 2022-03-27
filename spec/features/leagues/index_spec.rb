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
end