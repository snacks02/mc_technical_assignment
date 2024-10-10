# frozen_string_literal: true

class MatchPerformanceCalculateRatingJob
  include Sidekiq::Job

  def perform(match_performance_id)
    MatchPerformanceCalculateRatingService.call(match_performance_id)
  end
end
