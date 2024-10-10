# frozen_string_literal: true

require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  test "#index works" do
    team_a = create(:team, name: "Team A")
    team_b = create(:team, name: "Team B")
    match_1 = create(:match, weight: 13.37)
    player_1 = create(:player, name: "Player 1", team: team_a)
    player_2 = create(:player, name: "Player 2", team: team_b)
    create(
      :match_performance,
      :with_calculated_rating,
      role: :goalkeeper,
      goals: 11,
      passes: 11,
      saves: 11,
      match_id: match_1.id,
      player_id: player_1.id,
    )
    create(
      :match_performance,
      :with_calculated_rating,
      role: :midfielder,
      goals: 1,
      passes: 11,
      saves: 11,
      match_id: match_1.id,
      player_id: player_2.id,
    )

    get "/players"

    assert_response :success
    assert_equal response.parsed_body, [
      {
        "id" => player_1.id,
        "team_id" => team_a.id,
        "name" => player_1.name,
        "created_at" => player_1.created_at.iso8601(3),
        "updated_at" => player_1.updated_at.iso8601(3),
        "average_rating" => 588.28,
      },
      {
        "id" => player_2.id,
        "team_id" => team_b.id,
        "name" => player_2.name,
        "created_at" => player_2.created_at.iso8601(3),
        "updated_at" => player_2.updated_at.iso8601(3),
        "average_rating" => 410.459,
      },
    ]
  end
end
