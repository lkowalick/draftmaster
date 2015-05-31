# Join model for putting cards in decks
class CardDeck < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card

  LAND_NAMES = %w(Forest Island Mountain Swamp Plains)

  def self.land_card_decks(deck)
    LAND_NAMES.map do |land|
      card = Card.find_by!(name: land)
      CardDeck.new(card: card, deck: deck)
    end
  end
end
