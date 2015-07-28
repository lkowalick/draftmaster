class Match < ActiveRecord::Base
  belongs_to :round
  belongs_to :player_one, class: :Player, foreign_key: :player_one_id
  belongs_to :player_two, class: :Player, foreign_key: :player_two_id

  def players
    Player.where(id: [:player_one_id, :player_two_id])
  end
end
