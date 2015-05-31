Rails.application.routes.draw do
  devise_for :users
  root 'decks#index'

  resources :decks
  resources :card_decks
end
