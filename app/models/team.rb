# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :player, dependent: :destroy

  validates :name, presence: true
end
