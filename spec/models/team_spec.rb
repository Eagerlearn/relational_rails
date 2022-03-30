require 'rails_helper'

RSpec.describe Team do
  describe 'validations' do
    it do
      should validate_inclusion_of(:expansion_team).
        in_array([true , false])
    end

    it { should validate_presence_of :name }

    it { should validate_presence_of :number_of_players }
  end

  describe 'class method' do
    it 'only returns teams with expansion_teams true' do
      league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
      league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)

      team_1 = league_1.teams.create!(name: 'team1', expansion_team: true, number_of_players: 10)
      team_4 = league_2.teams.create!(name: 'team4', expansion_team: false, number_of_players: 53)
      team_5 = league_1.teams.create!(name: 'team5', expansion_team: true, number_of_players: 15)

      expect(Team.true_expansion_teams).to eq([team_1, team_5])
    end
  end
end