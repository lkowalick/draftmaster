require 'rails_helper'

RSpec.describe Match do
  it { is_expected.to belong_to(:round) }
  it { is_expected.to belong_to(:player_one) }
  it { is_expected.to belong_to(:player_two) }
  it { is_expected.to validate_inclusion_of(:player_one_wins).in_array([0, 1, 2]) }
  it { is_expected.to validate_inclusion_of(:player_two_wins).in_array([0, 1, 2]) }
  it { is_expected.to validate_inclusion_of(:draws).in_array([0, 1, 2]) }

  describe 'default win values' do
    subject { described_class.new(attributes) }

    context 'with no attributes' do
      let(:attributes) { { } }

      it 'has 0 for all win values' do
        expect(subject.player_one_wins).to eq(0)
        expect(subject.player_two_wins).to eq(0)
        expect(subject.draws).to eq(0)
      end
    end

    context 'with player_two_wins set' do
      let(:attributes) { { player_two_wins: player_two_wins } }
      let(:player_two_wins) { 2 }

      it 'has 0 for player_one_wins and draws' do
        expect(subject.player_one_wins).to eq(0)
        expect(subject.draws).to eq(0)
      end

      it 'set values for player_two_wins' do
        expect(subject.player_two_wins).to eq(2)
      end
    end
  end
end
