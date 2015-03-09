class Card < ActiveRecord::Base
  validates :number, uniqueness: { scope: :set }
  validates :name, presence: true
  validates :set, presence: true

  def self.sets
    select(:set).distinct.pluck(:set)
  end
end
