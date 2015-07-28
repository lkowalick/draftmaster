class Round < ActiveRecord::Base
  belongs_to :draft
  has_many :matches
end
