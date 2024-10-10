# frozen_string_literal: true

require "test_helper"

class MatchPerformanceCalculateRatingServiceTest < ActionDispatch::IntegrationTest
  test ".call works with the attacker role" do
    match_performance = create(:match_performance, role: :attacker)
    result, errors = MatchPerformanceCalculateRatingService.call(match_performance.id)

    assert_equal result, 336
    assert_nil errors
  end

  test ".call works with the defender role" do
    match_performance = create(:match_performance, role: :defender)
    result, errors = MatchPerformanceCalculateRatingService.call(match_performance.id)

    assert_equal result, 336
    assert_nil errors
  end

  test ".call works with the goalkeeper role" do
    match_performance = create(:match_performance, role: :goalkeeper)
    result, errors = MatchPerformanceCalculateRatingService.call(match_performance.id)

    assert_equal result, 336
    assert_nil errors
  end

  test ".call works with the midfielder role" do
    match_performance = create(:match_performance, role: :midfielder)
    result, errors = MatchPerformanceCalculateRatingService.call(match_performance.id)

    assert_equal result, 336
    assert_nil errors
  end
end
