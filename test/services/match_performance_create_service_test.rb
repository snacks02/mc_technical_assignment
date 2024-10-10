# frozen_string_literal: true

require "test_helper"

class MatchPerformanceCreateServiceTest < ActionDispatch::IntegrationTest
  test ".call works with the attacker role" do
    match = create(:match)
    player = create(:player)
    result, errors = MatchPerformanceCreateService.call(
      role: :attacker,
      goals: 1,
      passes: 33,
      saves: 7,
      match_id: match.id,
      player_id: player.id,
    )

    assert_equal result.role, "attacker"
    assert_nil result.rating
    assert_equal result.goals, 1
    assert_equal result.passes, 33
    assert_equal result.saves, 7
    assert_equal result.match_id, match.id
    assert_equal result.player_id, player.id
    assert_nil errors

    Sidekiq::Testing.inline! do
      MatchPerformanceCalculateRatingJob.perform_async(result.id)
    end

    assert_equal MatchPerformance.find(result.id).rating, 1764
  end

  test ".call works with the defender role" do
    match = create(:match)
    player = create(:player)
    result, errors = MatchPerformanceCreateService.call(
      role: :defender,
      goals: 1,
      passes: 33,
      saves: 7,
      match_id: match.id,
      player_id: player.id,
    )

    assert_equal result.role, "defender"
    assert_nil result.rating
    assert_equal result.goals, 1
    assert_equal result.passes, 33
    assert_equal result.saves, 7
    assert_equal result.match_id, match.id
    assert_equal result.player_id, player.id
    assert_nil errors

    Sidekiq::Testing.inline! do
      MatchPerformanceCalculateRatingJob.perform_async(result.id)
    end

    assert_equal MatchPerformance.find(result.id).rating, 3108
  end

  test ".call works with the goalkeeper role" do
    match = create(:match)
    player = create(:player)
    result, errors = MatchPerformanceCreateService.call(
      role: :goalkeeper,
      goals: 1,
      passes: 33,
      saves: 7,
      match_id: match.id,
      player_id: player.id,
    )

    assert_equal result.role, "goalkeeper"
    assert_nil result.rating
    assert_equal result.goals, 1
    assert_equal result.passes, 33
    assert_equal result.saves, 7
    assert_equal result.match_id, match.id
    assert_equal result.player_id, player.id
    assert_nil errors

    Sidekiq::Testing.inline! do
      MatchPerformanceCalculateRatingJob.perform_async(result.id)
    end

    assert_equal MatchPerformance.find(result.id).rating, 2016
  end

  test ".call works with the midfielder role" do
    match = create(:match)
    player = create(:player)
    result, errors = MatchPerformanceCreateService.call(
      role: :midfielder,
      goals: 1,
      passes: 33,
      saves: 7,
      match_id: match.id,
      player_id: player.id,
    )

    assert_equal result.role, "midfielder"
    assert_nil result.rating
    assert_equal result.goals, 1
    assert_equal result.passes, 33
    assert_equal result.saves, 7
    assert_equal result.match_id, match.id
    assert_equal result.player_id, player.id
    assert_nil errors

    Sidekiq::Testing.inline! do
      MatchPerformanceCalculateRatingJob.perform_async(result.id)
    end

    assert_in_delta MatchPerformance.find(result.id).rating, 2304.1200000000003
  end
end
