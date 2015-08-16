class Round < ActiveRecord::Base
  belongs_to :draft
  has_many :matches

  def complete
    matches.all?(&:completed)
  end
end
