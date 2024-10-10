# frozen_string_literal: true

module MatchPerformanceCalculateRatingService
  def self.call(match_performance_id)
    match_performance = MatchPerformance.joins(:match).find(match_performance_id)
    goals = match_performance.goals
    passes = match_performance.passes
    saves = match_performance.saves
    rating =
      (
        case match_performance.role
        when "attacker" then (goals * 2) + passes + saves
        when "defender" then goals + (passes * 2) + saves
        when "goalkeeper" then goals + passes + (saves * 2)
        when "midfielder" then (goals * 1.33) + (passes * 1.34) + (saves * 1.33)
        else raise "Reached unreachable"
        end
      ) * match_performance.match.weight
    match_performance.update!(rating: rating)
    [rating, nil]
  end
end
