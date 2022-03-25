class League < ApplicationRecord
  has_many :teams
  validates :professional, inclusion: { in: [ true, false ] }
  validates_presence_of :name

  validates_presence_of :years_in_existence
end