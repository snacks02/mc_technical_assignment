# frozen_string_literal: true

ActiveRecord::Base.transaction do
  team_a = Team.create!(name: "Team A")
  team_b = Team.create!(name: "Team B")

  match_1 = Match.create!(weight: 13.37)
  match_2 = Match.create!(weight: 73.31)

  player_1 = Player.create!(name: "Player 1", team: team_a)
  player_2 = Player.create!(name: "Player 2", team: team_a)
  player_3 = Player.create!(name: "Player 3", team: team_b)
  player_4 = Player.create!(name: "Player 4", team: team_b)

  MatchPerformanceCreateService.call(
    role: :goalkeeper,
    goals: 1,
    passes: 11,
    saves: 11,
    match_id: match_1.id,
    player_id: player_1.id,
  )
  MatchPerformanceCreateService.call(
    role: :goalkeeper,
    goals: 2,
    passes: 22,
    saves: 22,
    match_id: match_2.id,
    player_id: player_1.id,
  )
  MatchPerformanceCreateService.call(
    role: :attacker,
    goals: 11,
    passes: 11,
    saves: 1,
    match_id: match_1.id,
    player_id: player_2.id,
  )
  MatchPerformanceCreateService.call(
    role: :goalkeeper,
    goals: 2,
    passes: 22,
    saves: 22,
    match_id: match_2.id,
    player_id: player_2.id,
  )
  MatchPerformanceCreateService.call(
    role: :midfielder,
    goals: 11,
    passes: 11,
    saves: 11,
    match_id: match_1.id,
    player_id: player_3.id,
  )
  MatchPerformanceCreateService.call(
    role: :midfielder,
    goals: 22,
    passes: 22,
    saves: 22,
    match_id: match_2.id,
    player_id: player_3.id,
  )
  MatchPerformanceCreateService.call(
    role: :goalkeeper,
    goals: 1,
    passes: 11,
    saves: 11,
    match_id: match_1.id,
    player_id: player_4.id,
  )
  MatchPerformanceCreateService.call(
    role: :goalkeeper,
    goals: 2,
    passes: 22,
    saves: 22,
    match_id: match_2.id,
    player_id: player_4.id,
  )
end
