class RoundFactory
  def self.build(draft)
    new(draft).send(:build)
  end

  private

  attr_reader :draft

  def initialize(draft)
    @draft = draft
  end

  def build
    round = draft.rounds.build(number: next_round_number)
    round.matches = pairs_of_players.map do |pair|
      match = Match.create
      match.player_one = pair.first
      match.player_two = pair.second
      match
    end
    round
  end

  def pairs_of_players
    draft.players.shuffle.each_slice(2)
  end

  def next_round_number
    draft.next_round
  end
end
