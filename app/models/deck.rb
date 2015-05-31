# An abstraction of an MTG deck
class Deck < ActiveRecord::Base
  has_many :card_decks, dependent: :destroy
  has_many :cards, through: :card_decks
  belongs_to :user

  def most_recently_added_set
    card_deck = card_decks.order(created_at: :desc).first

    if card_deck.present?
      card_deck.card.set
    else
      Card.first.set
    end
  end
end
