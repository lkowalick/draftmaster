class Player < ApplicationRecord
  belongs_to :draft
  belongs_to :match
end
