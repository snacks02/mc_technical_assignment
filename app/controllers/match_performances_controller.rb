# frozen_string_literal: true

class MatchPerformancesController < ApplicationController
  def create
    result, errors = MatchPerformanceCreateService.call(**create_params.to_h.symbolize_keys)
    if errors.nil?
      render json: result
    else
      render json: { errors: errors }, status: :bad_request
    end
  end

  private

  def create_params
    params
      .except(:match_performance)
      .permit(
        :role,
        :goals,
        :passes,
        :saves,
        :match_id,
        :player_id,
      )
  end
end
