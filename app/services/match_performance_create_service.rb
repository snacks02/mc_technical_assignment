# frozen_string_literal: true

module MatchPerformanceCreateService
  def self.call(
    role:,
    goals:,
    passes:,
    saves:,
    match_id:,
    player_id:
  )
    match_performance = MatchPerformance.new(
      role: role,
      goals: goals,
      passes: passes,
      saves: saves,
      match_id: match_id,
      player_id: player_id,
    )
    return [nil, match_performance.errors] unless match_performance.save

    MatchPerformanceCalculateRatingJob.perform_async(match_performance.id)

    [match_performance, nil]
  end
end
