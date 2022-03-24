# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.destroy_all
League.destroy_all

league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)
league_3 = League.create!(name: 'league3', professional: false, years_in_existence: 7)
league_4 = League.create!(name: 'league4', professional: true, years_in_existence: 3)


league_1.teams.create!(name: 'team1', expansion_team: true, number_of_players: 10)
league_1.teams.create!(name: 'team2', expansion_team: false, number_of_players: 15)
league_1.teams.create!(name: 'team3', expansion_team: true, number_of_players: 12)

league_2.teams.create!(name: 'team4', expansion_team: false, number_of_players: 53)
league_2.teams.create!(name: 'team5', expansion_team: false, number_of_players: 19)
league_2.teams.create!(name: 'team6', expansion_team: true, number_of_players: 25)

league_3.teams.create!(name: 'team7', expansion_team: true, number_of_players: 7)
league_3.teams.create!(name: 'team8', expansion_team: true, number_of_players: 33)
league_3.teams.create!(name: 'team9', expansion_team: false, number_of_players: 16)

league_4.teams.create!(name: 'team10', expansion_team: false, number_of_players: 27)
league_4.teams.create!(name: 'team11', expansion_team: true, number_of_players: 40)
league_4.teams.create!(name: 'team12', expansion_team: true, number_of_players: 9)
