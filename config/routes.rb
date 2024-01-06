# config/routes.rb
Rails.application.routes.draw do
  resources :users, only: [:create, :index, :show] do
    resources :searches, only: [:create, :index]
  end
  resources :searches, only: [:create, :index], on: :collection
end
