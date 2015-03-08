class Card < ActiveRecord::Base
  validates :number, uniqueness: { scope: :set }
  validates :name, uniqueness: { scope: :set }

  def self.sets
    select(:set).distinct.pluck(:set)
  end
end
