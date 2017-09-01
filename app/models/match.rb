class Match < ApplicationRecord
  belongs_to :round
  belongs_to :player_one, class_name: :Player
  belongs_to :player_two, class_name: :Player
  after_initialize :set_default_wins
  validates :player_one_wins, inclusion: { in: [0, 1, 2] }
  validates :player_two_wins, inclusion: { in: [0, 1, 2] }
  validates :draws, inclusion: { in: [0, 1, 2] }
  # TODO: Add validation for wins summing to at most 3

  private

  def set_default_wins
    self.player_one_wins ||= 0
    self.player_two_wins ||= 0
    self.draws ||= 0
  end
end
