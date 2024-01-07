Rails.application.routes.draw do
  resources :users, only: [:create, :index, :show] do
    resources :searches, only: [:create, :index]
  end

  get 'show_searches', to: 'users#show_searches'
  get 'count_searches', to: 'users#count_searches'

  resources :searches, only: [:create, :index], on: :collection
end

