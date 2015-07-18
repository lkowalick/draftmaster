Rails.application.routes.draw do
  get 'drafts/create'

  get 'drafts/edit'

  get 'drafts/destroy'

  get 'drafts/new'

  get 'drafts/update'

  devise_for :users
  root 'decks#index'

  resources :decks
  resources :card_decks
end
