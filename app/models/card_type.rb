# Join model for associating card types with cards
class CardType < ApplicationRecord
  belongs_to :card
  belongs_to :type
end
