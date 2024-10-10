# frozen_string_literal: true

require "test_helper"

class PlayerIndexServiceTest < ActionDispatch::IntegrationTest
  test ".call works with from" do
    player_1 = create(:player)
    player_2 = create(:player)
    create(:match_performance, :with_calculated_rating, player_id: player_1.id)
    create(
      :match_performance,
      :with_calculated_rating,
      player_id: player_2.id,
      created_at: 1.hour.ago,
      updated_at: 1.hour.ago,
    )

    result, errors = PlayerIndexService.call(from: 30.minutes.ago)

    assert_equal result.size, 1
    assert_equal result.last["id"], player_1.id
    assert_equal result.last["average_rating"], 336
    assert_nil errors
  end

  test ".call works with order" do
    player_1 = create(:player)
    player_2 = create(:player)
    create(:match_performance, :with_calculated_rating, player_id: player_1.id, goals: 0)
    create(:match_performance, :with_calculated_rating, player_id: player_2.id, goals: 99_999)

    result, errors = PlayerIndexService.call(order: :asc)

    assert_equal result.size, 2
    assert_equal result.first["id"], player_1.id
    assert_equal result.last["id"], player_2.id
    assert_nil errors

    result, errors = PlayerIndexService.call(order: :desc)

    assert_equal result.size, 2
    assert_equal result.first["id"], player_2.id
    assert_equal result.last["id"], player_1.id
    assert_nil errors
  end

  test ".call works with page" do
    11.times do |i|
      player = create(:player, name: i)
      create(:match_performance, player: player)
    end

    result, errors = PlayerIndexService.call(page: 1)

    assert_equal result.size, 1
    assert_nil errors
  end

  test ".call works with role" do
    player_1 = create(:player)
    player_2 = create(:player)
    create(:match_performance, player_id: player_1.id, role: :attacker)
    create(:match_performance, player_id: player_2.id, role: :defender)

    result, errors = PlayerIndexService.call(role: :attacker)

    assert_equal result.size, 1
    assert_equal result.last["id"], player_1.id
    assert_nil errors
  end

  test ".call works with team_id" do
    team_1 = create(:team)
    team_2 = create(:team)
    player_1 = create(:player, team: team_1)
    player_2 = create(:player, team: team_2)
    create(:match_performance, player_id: player_1.id)
    create(:match_performance, player_id: player_2.id)

    result, errors = PlayerIndexService.call(team_id: team_1.id)

    assert_equal result.size, 1
    assert_equal result.last["id"], player_1.id
    assert_nil errors
  end

  test ".call works with to" do
    player_1 = create(:player)
    player_2 = create(:player)
    create(:match_performance, player_id: player_1.id)
    create(
      :match_performance,
      player_id: player_2.id,
      created_at: 1.hour.ago,
      updated_at: 1.hour.ago,
    )

    result, errors = PlayerIndexService.call(to: 30.minutes.ago)

    assert_equal result.size, 1
    assert_equal result.last["id"], player_2.id
    assert_nil errors
  end
end
