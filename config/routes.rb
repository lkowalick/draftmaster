Rails.application.routes.draw do
  root 'decks#index'

  get 'decks/create'

  get 'decks/update'

  get 'decks/show'

  get 'decks/edit'

  get 'decks/new'

  get 'decks/index'
end
