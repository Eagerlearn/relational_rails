class Team < ApplicationRecord
  belongs_to :league
  validates :expansion_team, inclusion: { in: [ true, false ] }
  validates_presence_of :name

  validates_presence_of :number_of_players

  def self.true_expansion_teams
    Team.where(expansion_team: true)
  end
end