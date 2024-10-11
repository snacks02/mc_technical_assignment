# frozen_string_literal: true

require "test_helper"

class MatchPerformanceCalculateRatingJobTest < ActionDispatch::IntegrationTest
  test "#perform works" do
    match_performance = create(:match_performance)

    MatchPerformanceCalculateRatingJob.new.perform(match_performance.id)

    assert_equal MatchPerformance.find(match_performance.id).rating, 336
  end
end
