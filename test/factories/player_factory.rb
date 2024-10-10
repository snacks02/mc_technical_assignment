# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    team
    name { "Geralt" }
  end
end
