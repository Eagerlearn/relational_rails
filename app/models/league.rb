class League < ApplicationRecord
  has_many :teams
  validates :professional, inclusion: { in: [ true, false ] }
end