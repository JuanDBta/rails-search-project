# config/routes.rb
Rails.application.routes.draw do
  get 'searches/index'
  get 'searches/create'
  get 'users/create'
  resources :users, only: [:create, :index] do
    resources :searches, only: [:create, :index]
  end
end
