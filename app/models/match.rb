class Match < ActiveRecord::Base
  belongs_to :round
  belongs_to :player_one, class_name: :Player
  belongs_to :player_two, class_name: :Player
end
