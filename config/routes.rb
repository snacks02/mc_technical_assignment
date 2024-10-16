# frozen_string_literal: true

Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :match_performances, only: %i[create]
  resources :players, only: %i[index]
end
