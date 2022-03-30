class League < ApplicationRecord
  has_many :teams, :dependent => :destroy
  validates :professional, inclusion: { in: [ true, false ] }
  validates_presence_of :name

  validates_presence_of :years_in_existence

  def self.order_by_creation_date
    League.order(created_at: :desc)
  end

  def total_team_count
    self.teams.count
  end

  def alphabetical_order
    # require "pry"; binding.pry
    self.teams.order(:name)
  end

  def number_of_players_filter(number_of_players)
    teams.where('number_of_players > ?', number_of_players)
  end
end