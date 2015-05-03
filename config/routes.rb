Rails.application.routes.draw do
  root 'decks#index'

  resources :decks
  resources :card_decks
end
