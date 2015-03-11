class Card < ActiveRecord::Base
  validates :number, uniqueness: { scope: :set }
  validates :name, presence: true
  validates :set, presence: true
  has_many :card_types
  has_many :types, through: :card_types

  def self.sets
    select(:set).distinct.pluck(:set)
  end
end
