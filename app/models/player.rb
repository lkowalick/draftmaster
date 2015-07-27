class Player < ActiveRecord::Base
  belongs_to :draft
  belongs_to :match
end
