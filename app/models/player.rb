# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :team
  has_many :match_performances, dependent: :destroy

  validates :name, presence: true
end
