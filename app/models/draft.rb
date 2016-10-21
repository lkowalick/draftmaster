class Draft < ActiveRecord::Base
  has_many :players
  has_many :rounds
  before_create :create_first_round
  accepts_nested_attributes_for :players, reject_if: :all_blank

  def next_round
    round_numbers = rounds.map(&:number).compact
    if round_numbers.any?
      round_numbers.max + 1
    else
      1
    end
  end

  private

  def create_first_round
    RoundFactory.build(self)
  end
end
