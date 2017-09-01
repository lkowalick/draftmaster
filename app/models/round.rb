class Round < ApplicationRecord
  belongs_to :draft
  has_many :matches

  def complete
    matches.all?(&:completed)
  end
end
