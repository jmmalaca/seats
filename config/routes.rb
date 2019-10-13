# frozen_string_literal: true

Rails.application.routes.draw do
  resources :seats

  post '/seats/:id/select', to: 'seats#select'
  post '/seats/:id/deselect', to: 'seats#deselect'
  delete '/session/seats', to: 'seats#destroy'
  get '/', to: 'seats#index'
end
