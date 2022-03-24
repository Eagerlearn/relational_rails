# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
League.destroy_all

@league_1 = League.create!(name: 'league1', professional: true, years_in_existence: 5)
@league_2 = League.create!(name: 'league2', professional: false, years_in_existence: 10)
@league_3 = League.create!(name: 'league3', professional: false, years_in_existence: 7)
@league_4 = League.create!(name: 'league4', professional: true, years_in_existence: 3)
