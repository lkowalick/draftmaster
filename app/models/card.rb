# An abstraction of an MTG card
class Card < ApplicationRecord
  validates :number, uniqueness: { scope: :set }
  validates :name, presence: true
  validates :set, presence: true
  has_many :card_types, dependent: :destroy
  has_many :types, through: :card_types
  has_many :card_decks, dependent: :destroy
  has_many :decks, through: :card_decks

  def self.sets
    select(:set).distinct.pluck(:set)
  end
end
