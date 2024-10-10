# frozen_string_literal: true

require "test_helper"

class MatchPerformancesControllerTest < ActionDispatch::IntegrationTest
  test "#create works" do
    match = create(:match)
    player = create(:player)

    post "/match_performances",
         params: {
           role: "goalkeeper",
           goals: 1,
           passes: 33,
           saves: 7,
           match_id: match.id,
           player_id: player.id,
         }

    assert_response :success

    parsed_body = response.parsed_body

    assert_equal parsed_body["role"], "goalkeeper"
    assert_nil parsed_body["rating"]
    assert_equal parsed_body["goals"], 1
    assert_equal parsed_body["passes"], 33
    assert_equal parsed_body["saves"], 7
    assert_equal parsed_body["match_id"], match.id
    assert_equal parsed_body["player_id"], player.id
  end
end
