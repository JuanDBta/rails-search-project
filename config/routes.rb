Rails.application.routes.draw do
  resources :users, only: [:create, :index, :show] do
    resources :searches, only: [:create, :index]
  end

  get 'show_searches', to: 'users#show_searches'
  get 'count_searches', to: 'users#count_searches'
  get 'favorite_word', to: 'users#favorite_word'
  get 'average_words_per_search', to: 'users#average_words_per_search'

  average_words_per_search

  resources :searches, only: [:create, :index], on: :collection
end

