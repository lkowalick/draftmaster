class CardType < ActiveRecord::Base
  has_many :cards
  has_many :types
end
