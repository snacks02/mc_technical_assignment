# frozen_string_literal: true

module PlayerIndexService
  def self.call(
    from: nil,
    order: :desc,
    page: 0,
    role: nil,
    team_id: nil,
    to: nil
  )
    return [nil, %("order" should be "asc" or "desc")] unless order.to_s.in?(%w[asc desc])

    optional_conditions = {}
    optional_conditions[:match_performances] = { role: role } if role
    optional_conditions[:team_id] = team_id if team_id

    from = Time.zone.parse(from) if from.is_a?(String)
    to = Time.zone.parse(to) if to.is_a?(String)
    parameters =
      [from, order, page, role, team_id, to]
      .map { |parameter| CGI.escape(parameter.to_s) }
      .join(":")

    result =
      Rails.cache.fetch("player_index_service/result:#{parameters}", expires_in: 10.minutes) do
        Player
          .select("players.*, AVG(match_performances.rating) AS average_rating")
          .left_outer_joins(match_performances: :match)
          .where(match_performances: { created_at: from..to })
          .where(optional_conditions)
          .limit(10)
          .offset(page * 10)
          .group("match_performances.id, matches.id, players.id")
          .order("average_rating #{order}")
          .map(&:attributes)
      end

    [result, nil]
  end
end
