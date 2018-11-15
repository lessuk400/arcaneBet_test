# frozen_string_literal: true

Rails.application.routes.draw do
  resources :stocks, except: %i[edit update]
end
