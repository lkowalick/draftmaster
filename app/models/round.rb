class Round < ActiveRecord::Base
  belongs_to :draft
  has_many :matches
  before_create :set_number

  private

  def set_number
    self.number = draft.next_round
    true # cuz callbacks
  end
end
