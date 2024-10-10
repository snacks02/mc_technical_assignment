# frozen_string_literal: true

class Match < ApplicationRecord
  validates :weight, presence: true
end
