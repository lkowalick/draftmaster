class Card < ActiveRecord::Base
  validates :number, uniqueness: { scope: :set }
  validates :name, uniqueness: true
end
