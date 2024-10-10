# frozen_string_literal: true

class PlayersController < ApplicationController
  def index
    result, errors = PlayerIndexService.call(**index_params.to_h.symbolize_keys)
    if errors.nil?
      render json: result
    else
      render json: { errors: errors }, status: :bad_request
    end
  end

  private

  def index_params
    params
      .except(:player)
      .permit(
        :from,
        :offset,
        :order,
        :role,
        :team_id,
        :to,
      )
  end
end
