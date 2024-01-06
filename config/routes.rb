# config/routes.rb
Rails.application.routes.draw do
  get 'users/create'
  resources :users, only: [:create, :show] do
    resources :searches, only: [:create, :index]
  end
end
