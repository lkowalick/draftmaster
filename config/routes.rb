Rails.application.routes.draw do
  resources :drafts do
    resources :rounds, only: [:create]
  end

  resources :rounds, only: [:show]

  devise_for :users
  root 'decks#index'

  resources :decks
  resources :matches, only: [:create,:update]
  resources :card_decks
end
