require 'rails_helper'

RSpec.describe RoundFactory do
  subject { described_class.build(draft) }

  describe 'round number' do
    context 'when a draft has no rounds' do
      let(:draft) { Draft.new }

      its(:number) { is_expected.to eq(1) }
    end

    context 'when a draft some rounds with numbers 1, 2, and 5' do
      let(:draft) { Draft.new }

      before do
        draft.rounds << Round.new(number: 1)
        draft.rounds << Round.new(number: 5)
        draft.rounds << Round.new(number: 2)
      end

      its(:number) { is_expected.to eq(6) }
    end

    context 'when a draft some rounds with no numbers' do
      let(:draft) { Draft.new }

      before do
        draft.rounds << Round.new
        draft.rounds << Round.new
        draft.rounds << Round.new
      end

      its(:number) { is_expected.to eq(1) }
    end
  end

  describe 'pairing players' do
    context 'a new draft of 8 players' do
      let(:draft) do
        draft = Draft.new
        draft.players = 8.times.map { |i| Player.new(name: "Player #{i}") }
        draft
      end

      before do
        srand 1234
      end

      it 'should pair all players randomly' do
        expect(subject.matches.map { |m| [m.player_one.name, m.player_two.name] }).to(
          eq([['Player 2', 'Player 1'],
              ['Player 6', 'Player 0'],
              ['Player 4', 'Player 5'],
              ['Player 3', 'Player 7']]))
      end
    end
  end
end
