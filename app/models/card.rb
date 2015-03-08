class Card < ActiveRecord::Base
  validates :number, uniqueness: { scope: :set }

  def self.sets
    select(:set).distinct.pluck(:set)
  end
end
