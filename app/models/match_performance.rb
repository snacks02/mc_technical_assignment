# frozen_string_literal: true

class MatchPerformance < ApplicationRecord
  belongs_to :match
  belongs_to :player

  enum :role, {
    attacker: "attacker",
    defender: "defender",
    goalkeeper: "goalkeeper",
    midfielder: "midfielder",
  }, prefix: true, validate: true

  validates :role, presence: true
  validates :goals, numericality: { only_integer: true }, presence: true
  validates :passes, numericality: { only_integer: true }, presence: true
  validates :saves, numericality: { only_integer: true }, presence: true
end
