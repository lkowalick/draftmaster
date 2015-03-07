class Deck < ActiveRecord::Base
  has_many :card_decks, inverse_of: :deck
  has_many :cards, through: :card_decks
end
