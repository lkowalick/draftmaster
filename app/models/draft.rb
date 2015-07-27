class Draft < ActiveRecord::Base
  has_many :players
  has_many :rounds
  accepts_nested_attributes_for :players, reject_if: :all_blank

  def next_round
    round_numbers = rounds.map(&:number).compact
    if round_numbers.any?
      round_numbers.max + 1
    else
      1
    end
  end
end
