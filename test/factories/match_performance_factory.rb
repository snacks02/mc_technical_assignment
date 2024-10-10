# frozen_string_literal: true

FactoryBot.define do
  factory :match_performance do
    role { "attacker" }
    rating { 106.96 }
    goals { 2 }
    passes { 2 }
    saves { 2 }
    match
    player

    trait :with_calculated_rating do
      after :create do |match_performance, _context|
        MatchPerformanceCalculateRatingService.call(match_performance.id)
      end
    end
  end
end
