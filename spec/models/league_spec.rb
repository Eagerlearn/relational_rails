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

  it 'can return the total count of teams for the league' do
    league_3 = League.create!(name: 'league3', professional: false, years_in_existence: 7)
    league_4 = League.create!(name: 'league4', professional: true, years_in_existence: 9)

    team_2 = league_3.teams.create!(name: 'team2', expansion_team: true, number_of_players: 10)
    team_3 = league_3.teams.create!(name: 'team3', expansion_team: false, number_of_players: 53)
    team_1 = league_4.teams.create!(name: 'team1', expansion_team: true, number_of_players: 16)

    expect(league_3.total_team_count).to eq(2)
    expect(league_4.total_team_count).to eq(1)
  end

  it 'sorts the leagues teams in alphabetical order by name' do
    league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
    league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)

    team_1 = league_1.teams.create!(name: 'teams1', expansion_team: true, number_of_players: 10)
    team_3 = league_1.teams.create!(name: 'teams3', expansion_team: true, number_of_players: 25)
    team_4 = league_2.teams.create!(name: 'team4', expansion_team: false, number_of_players: 53)
    team_5 = league_1.teams.create!(name: 'team5', expansion_team: true, number_of_players: 15)

    expect(league_1.alphabetical_order).to eq([team_5, team_1, team_3])
  end

   it 'can return the teams with over 10 players' do
     league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
     league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)

     team_1 = league_1.teams.create!(name: 'teams1', expansion_team: true, number_of_players: 10)
     team_3 = league_1.teams.create!(name: 'teams3', expansion_team: true, number_of_players: 25)
     team_4 = league_2.teams.create!(name: 'team4', expansion_team: false, number_of_players: 53)
     team_5 = league_1.teams.create!(name: 'team5', expansion_team: true, number_of_players: 15)

     expect(league_1.number_of_players_filter(10)).to eq([team_3, team_5])
   end
end

