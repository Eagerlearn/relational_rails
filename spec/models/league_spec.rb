require 'rails_helper'

RSpec.describe League do
  describe 'validations' do
    it do
      should validate_inclusion_of(:professional).
        in_array([true , false])
    end

    it { should validate_presence_of :name }

    it { should validate_presence_of :years_in_existence }
  end

  it 'puts leagues in order by created at date' do
    league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
    league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)
    league_3 = League.create!(name: 'league3', professional: false, years_in_existence: 7)
    league_4 = League.create!(name: 'league4', professional: true, years_in_existence: 3)

    expect(League.order_by_creation_date).to eq([league_4, league_3, league_2, league_1])
  end
end

