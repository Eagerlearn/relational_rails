class Team < ApplicationRecord
  belongs_to :league
  validates :expansion_team, inclusion: { in: [ true, false ] }
  validates_presence_of :name
  validates_presence_of :expansion_team
  validates_presence_of :number_of_players
end