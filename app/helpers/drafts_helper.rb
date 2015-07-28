module DraftsHelper
  def next_round_ordinal(draft)
    draft.next_round.ordinalize
  end
end
